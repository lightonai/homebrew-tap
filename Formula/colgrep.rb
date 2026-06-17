class Colgrep < Formula
  desc "Semantic code search powered by ColBERT"
  homepage "https://github.com/lightonai/next-plaid"
  version "1.5.6"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.5.6/colgrep-aarch64-apple-darwin.tar.xz"
      sha256 "c8860c10e6a3a32438112f7bcca9914af87ea68b70264ba26c3647a2acef7172"
    end

    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.5.6/colgrep-x86_64-apple-darwin.tar.xz"
      sha256 "941b8350fabc46638f369d1acb6bec2a721b18a0257b1a46420a949965277d36"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.5.6/colgrep-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "4e5ea09635c9d8e9c25363ba19595c14da118cf126517a3785cd8452dd303f2c"
    end
  end

  def install
    bin.install "colgrep"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/colgrep --version")
  end
end
