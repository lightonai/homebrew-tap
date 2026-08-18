class Colgrep < Formula
  desc "Semantic code search powered by ColBERT"
  homepage "https://github.com/lightonai/next-plaid"
  version "1.7.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.7.0/colgrep-aarch64-apple-darwin.tar.xz"
      sha256 "46fe21e58247692c2b431c69dccc14cc6c5495580f00b680e055e38cc3a8e47e"
    end

    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.7.0/colgrep-x86_64-apple-darwin.tar.xz"
      sha256 "13d128444424b058bc6d24c9fa10a5467faf1426f6cef9330baabdef6cfd1daf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.7.0/colgrep-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "f1522e2dd43e5eab89668bdf6cfbe0996d1ada9aba75d9d8de1a2902cab2b022"
    end
  end

  def install
    bin.install "colgrep"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/colgrep --version")
  end
end
