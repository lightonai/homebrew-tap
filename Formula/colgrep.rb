class Colgrep < Formula
  desc "Semantic code search powered by ColBERT"
  homepage "https://github.com/lightonai/next-plaid"
  version "1.8.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.8.0/colgrep-aarch64-apple-darwin.tar.xz"
      sha256 "409697d1586b14a21dfe4f6e10524dc5f167e60fb1f167d4e530cb2d03b01707"
    end

    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.8.0/colgrep-x86_64-apple-darwin.tar.xz"
      sha256 "09bcb7c8f0560895c4422d82e07139f9f8340ecd7a9d2d3df30dd0a044f11777"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.8.0/colgrep-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "e9f87f81e3606691e1e594627a1d2185e22040aacef7bbfbd8947f7622d3e9fd"
    end

    on_arm do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.8.0/colgrep-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "9f73c33f896f8079b6a997edd4fca778b40b600cacce14c69840fca7d75792fd"
    end
  end

  def install
    bin.install "colgrep"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/colgrep --version")
  end
end
