class Colgrep < Formula
  desc "Semantic code search powered by ColBERT"
  homepage "https://github.com/lightonai/next-plaid"
  version "1.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.2.0/colgrep-aarch64-apple-darwin.tar.xz"
      sha256 "dc23caabd1f2e9e9ebc0ce551d2aa53ecbcbf8199c6f2259cc9e4639375aa500"
    end

    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.2.0/colgrep-x86_64-apple-darwin.tar.xz"
      sha256 "254dd280fd86a43933f5fabc7beefe32fe5c3a1e3ae22885311908091584b977"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.2.0/colgrep-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "0bb54942c28e5a1513d6027816e3f8b8ab7f69cc9d96a36bf128afaff3b84f7d"
    end
  end

  def install
    bin.install "colgrep"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/colgrep --version")
  end
end
