#!/bin/bash
# Update the colgrep Homebrew formula for a new release
# Usage: ./scripts/update-formula.sh 1.1.0
set -euo pipefail

VERSION="${1:?Usage: $0 <version>}"
REPO="lightonai/next-plaid"
FORMULA="Formula/colgrep.rb"

echo "Updating formula to v${VERSION}..."

# Fetch SHA256 for each binary asset
fetch_binary_sha() {
  local asset="$1"
  local sha_file="${asset}.sha256"
  gh release download "v${VERSION}" --repo "${REPO}" -p "${sha_file}" -O - 2>/dev/null | awk '{print $1}'
}

echo "Fetching binary SHAs..."
AARCH64_DARWIN_SHA=$(fetch_binary_sha "colgrep-aarch64-apple-darwin.tar.xz")
X86_64_DARWIN_SHA=$(fetch_binary_sha "colgrep-x86_64-apple-darwin.tar.xz")
X86_64_LINUX_SHA=$(fetch_binary_sha "colgrep-x86_64-unknown-linux-gnu.tar.xz")

echo "  aarch64-apple-darwin: ${AARCH64_DARWIN_SHA}"
echo "  x86_64-apple-darwin:  ${X86_64_DARWIN_SHA}"
echo "  x86_64-linux-gnu:     ${X86_64_LINUX_SHA}"

# Generate the updated formula
cat > "${FORMULA}" <<RUBY
class Colgrep < Formula
  desc "Semantic code search powered by ColBERT"
  homepage "https://github.com/${REPO}"
  version "${VERSION}"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/${REPO}/releases/download/v${VERSION}/colgrep-aarch64-apple-darwin.tar.xz"
      sha256 "${AARCH64_DARWIN_SHA}"
    end

    on_intel do
      url "https://github.com/${REPO}/releases/download/v${VERSION}/colgrep-x86_64-apple-darwin.tar.xz"
      sha256 "${X86_64_DARWIN_SHA}"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/${REPO}/releases/download/v${VERSION}/colgrep-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "${X86_64_LINUX_SHA}"
    end
  end

  def install
    bin.install "colgrep"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/colgrep --version")
  end
end
RUBY

echo ""
echo "Formula updated to v${VERSION}!"
echo "Don't forget to commit and push:"
echo "  git add Formula/colgrep.rb"
echo "  git commit -m 'Update colgrep to ${VERSION}'"
echo "  git push"
