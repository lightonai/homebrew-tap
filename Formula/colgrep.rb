class Colgrep < Formula
  desc "Semantic code search powered by ColBERT"
  homepage "https://github.com/lightonai/next-plaid"
  version "1.8.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.8.5/colgrep-aarch64-apple-darwin.tar.xz"
      sha256 "2cd013c820a6ba9d4066c58ce7e6b75ea614dd77a9a18a88836e005f1ef126bc"
    end

    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.8.5/colgrep-x86_64-apple-darwin.tar.xz"
      sha256 "6f23777e87a7cee9c31846514bc0a70736df71f201abfff6aedb51dc27ec6c2a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.8.5/colgrep-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "532e1da739f6b5d489cdaefd20c5918fa1bb0ff9f456c89098eb49a6379ae205"
    end

    on_arm do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.8.5/colgrep-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "90ccb4132ca34c5202ca3d9789e722446dfed85b3be6247321ee55e1a909f34b"
    end
  end

  def install
    bin.install "colgrep"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/colgrep --version")
  end
end
