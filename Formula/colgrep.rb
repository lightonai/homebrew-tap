class Colgrep < Formula
  desc "Semantic code search powered by ColBERT"
  homepage "https://github.com/lightonai/next-plaid"
  version "1.6.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.6.4/colgrep-aarch64-apple-darwin.tar.xz"
      sha256 "850471d689d9c48e1016d54ed720f342187c2c6c463b71ef01bd3fc0cd10f5c9"
    end

    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.6.4/colgrep-x86_64-apple-darwin.tar.xz"
      sha256 "c57db851f63fb43a79b4d0b21b88280651d72773ab017c42ad4536e8c602dbbf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.6.4/colgrep-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "6f1dbcffd36e30a34541ee38a7dadc43131d654f06a32c400dfc3a266cad69d7"
    end
  end

  def install
    bin.install "colgrep"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/colgrep --version")
  end
end
