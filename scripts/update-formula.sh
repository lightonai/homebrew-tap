#!/bin/bash
# Update the colgrep Homebrew formula for a new release
# Usage: ./scripts/update-formula.sh 1.1.0
set -euo pipefail

VERSION="${1:?Usage: $0 <version>}"
REPO="lightonai/next-plaid"
FORMULA="Formula/colgrep.rb"

echo "Updating formula to v${VERSION}..."

# Fetch SHA256 for source tarball
echo "Fetching source tarball SHA..."
SOURCE_SHA=$(curl -sL "https://github.com/${REPO}/archive/refs/tags/v${VERSION}.tar.gz" | shasum -a 256 | awk '{print $1}')
echo "  Source: ${SOURCE_SHA}"

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

  # Source tarball (used for building from source as fallback)
  url "https://github.com/${REPO}/archive/refs/tags/v#{version}.tar.gz"
  sha256 "${SOURCE_SHA}"

  # Prebuilt binaries per platform
  on_macos do
    on_arm do
      resource "binary" do
        url "https://github.com/${REPO}/releases/download/v#{version}/colgrep-aarch64-apple-darwin.tar.xz"
        sha256 "${AARCH64_DARWIN_SHA}"
      end
    end

    on_intel do
      resource "binary" do
        url "https://github.com/${REPO}/releases/download/v#{version}/colgrep-x86_64-apple-darwin.tar.xz"
        sha256 "${X86_64_DARWIN_SHA}"
      end
    end
  end

  on_linux do
    on_intel do
      resource "binary" do
        url "https://github.com/${REPO}/releases/download/v#{version}/colgrep-x86_64-unknown-linux-gnu.tar.xz"
        sha256 "${X86_64_LINUX_SHA}"
      end
    end
  end

  # Rust is only needed when building from source (no prebuilt binary available)
  depends_on "rust" => :build

  def install
    # Try to use prebuilt binary first
    if resources.key?("binary")
      binary_installed = install_prebuilt_binary
      return if binary_installed
    end

    # Fall back to building from source
    ohai "No prebuilt binary available, building from source..."
    install_from_source
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/colgrep --version")
  end

  private

  def install_prebuilt_binary
    resource("binary").stage do
      # Binary is inside a directory named colgrep-{target}/
      binary = Dir["*/colgrep"].first
      if binary && File.exist?(binary)
        bin.install binary
        return true
      end
    end
    false
  rescue => e
    opoo "Failed to install prebuilt binary (#{e.message}), falling back to source build"
    false
  end

  def install_from_source
    features = []

    if OS.mac?
      features << "accelerate"
      features << "coreml" if Hardware::CPU.arm?
    end

    args = ["--release", "-p", "colgrep"]
    args += ["--features", features.join(",")] unless features.empty?

    system "cargo", "build", *args
    bin.install "target/release/colgrep"
  end
end
RUBY

echo ""
echo "Formula updated to v${VERSION}!"
echo "Don't forget to commit and push:"
echo "  git add Formula/colgrep.rb"
echo "  git commit -m 'Update colgrep to ${VERSION}'"
echo "  git push"
