class Colgrep < Formula
  desc "Semantic code search powered by ColBERT"
  homepage "https://github.com/lightonai/next-plaid"
  version "1.0.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.0.8/colgrep-aarch64-apple-darwin.tar.xz"
      sha256 "a81ffd067428548dfb384224f98a35ef4c8e828f923562acef1e6d5fe1544517"
    end

    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.0.8/colgrep-x86_64-apple-darwin.tar.xz"
      sha256 "9cf9dbcf1840bd8227ac64596aa6a4733a7b6b10498820c5b9307e4a0df641b6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.0.8/colgrep-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "d397ce5cc5928fd4d762eeecbb0629f9c7689ab1e71ec7403c21218ae0612b27"
    end
  end

  def install
    bin.install "colgrep"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/colgrep --version")
  end
end
