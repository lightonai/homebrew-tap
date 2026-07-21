class Colgrep < Formula
  desc "Semantic code search powered by ColBERT"
  homepage "https://github.com/lightonai/next-plaid"
  version "1.6.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.6.3/colgrep-aarch64-apple-darwin.tar.xz"
      sha256 "74613be7d63b75a602689917f1d145c75b016db06f4509b591e4aa2eca4a0d0f"
    end

    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.6.3/colgrep-x86_64-apple-darwin.tar.xz"
      sha256 "33616999cdba647e685875dd08fc1cdd4b5d6e85b514a37b80540518d40d2564"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.6.3/colgrep-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "b1f80618579a2e5f9acebaa5f0cf8cd09fd96b05be8648b4be8af36d9bf3db7e"
    end
  end

  def install
    bin.install "colgrep"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/colgrep --version")
  end
end
