class Colgrep < Formula
  desc "Semantic code search powered by ColBERT"
  homepage "https://github.com/lightonai/next-plaid"
  version "1.8.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.8.1/colgrep-aarch64-apple-darwin.tar.xz"
      sha256 "0599276fd9bbc9ae4a8b72a52b00eeca2c37793d8c7854ded9a74a096492f5dc"
    end

    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.8.1/colgrep-x86_64-apple-darwin.tar.xz"
      sha256 "fa32105ed7df97c3ec156a487affb79c035255414044bfbf5080e315ca5b56f7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.8.1/colgrep-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "c0c499c8e255099acfe345663dae8aa360c3c383e26c981fd112c694d0309895"
    end

    on_arm do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.8.1/colgrep-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "ed86e1f286cf429c19b44b169ed50a6cdf8d7992da2122edbb94ebff34d0d345"
    end
  end

  def install
    bin.install "colgrep"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/colgrep --version")
  end
end
