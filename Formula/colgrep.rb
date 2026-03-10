class Colgrep < Formula
  desc "Semantic code search powered by ColBERT"
  homepage "https://github.com/lightonai/next-plaid"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.1.0/colgrep-aarch64-apple-darwin.tar.xz"
      sha256 "9d440393cfb2faa9d612c990f667103f1ea95f685e869c4051bd6ffd502be8c3"
    end

    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.1.0/colgrep-x86_64-apple-darwin.tar.xz"
      sha256 "5b3ac7457f64d02a34031fdd8cb3c753d370bd335f3747dd23d64b3e71862619"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.1.0/colgrep-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "ecf57b632b014b82b368ed736f408b2cf7add107726499df4fcf8bbc0c1ab65c"
    end
  end

  def install
    bin.install "colgrep"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/colgrep --version")
  end
end
