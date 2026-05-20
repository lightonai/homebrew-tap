class Colgrep < Formula
  desc "Semantic code search powered by ColBERT"
  homepage "https://github.com/lightonai/next-plaid"
  version "1.3.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.3.0/colgrep-aarch64-apple-darwin.tar.xz"
      sha256 "a27c8b3d667f480e9774a32fa9ab47a2528c7ebe1e8c1fb0ef413537abc470ef"
    end

    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.3.0/colgrep-x86_64-apple-darwin.tar.xz"
      sha256 "1d02696d6535455300b38acf36d8bc579d4a1c202a70d133bfc699ba658b1f6a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.3.0/colgrep-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "7e6f8719dd804cea11131415895db8b871df94798ea232fc71afc01aefb276e0"
    end
  end

  def install
    bin.install "colgrep"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/colgrep --version")
  end
end
