class Colgrep < Formula
  desc "Semantic code search powered by ColBERT"
  homepage "https://github.com/lightonai/next-plaid"
  version "1.8.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.8.3/colgrep-aarch64-apple-darwin.tar.xz"
      sha256 "bc2746aafd12b5e48613aba0cb4bcb1f2180c04da32313ec97b9064fa60b0aca"
    end

    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.8.3/colgrep-x86_64-apple-darwin.tar.xz"
      sha256 "d0a14d6cafbd23608d4e90d4408a5fe2fbe28abfc57db9821794ee1c7303ad79"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.8.3/colgrep-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "f0047e18903b3bf110ff116d1400c5c857ce75f71068c5d4c44f434c9701e106"
    end

    on_arm do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.8.3/colgrep-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "8b59b9d2e4f56fb5b84129979af8ac5c6fa00ba0da2bcd7dc2078021f3198734"
    end
  end

  def install
    bin.install "colgrep"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/colgrep --version")
  end
end
