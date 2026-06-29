class Colgrep < Formula
  desc "Semantic code search powered by ColBERT"
  homepage "https://github.com/lightonai/next-plaid"
  version "1.6.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.6.1/colgrep-aarch64-apple-darwin.tar.xz"
      sha256 "4515a99bff43e54622f054c5f0beeb495f5760f1dc619993d66c2c119e51afa9"
    end

    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.6.1/colgrep-x86_64-apple-darwin.tar.xz"
      sha256 "e215e4283d150103414eac5757c268e461c73e7b5e78cd2ca52ed5e9922407bb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.6.1/colgrep-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "2989b5c1c4fcda4f50f7a882eeafbd95a187766cd82fb4c7f12e37f4cbc76ede"
    end
  end

  def install
    bin.install "colgrep"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/colgrep --version")
  end
end
