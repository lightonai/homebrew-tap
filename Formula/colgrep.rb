class Colgrep < Formula
  desc "Semantic code search powered by ColBERT"
  homepage "https://github.com/lightonai/next-plaid"
  version "1.3.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.3.1/colgrep-aarch64-apple-darwin.tar.xz"
      sha256 "2be22f174316650951bc938dc67c58f2bb8c9f0ba5e2911159259b1068970cf9"
    end

    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.3.1/colgrep-x86_64-apple-darwin.tar.xz"
      sha256 "621bc692a6cfcdb7556a35f4dbf1ed0a371ea4502de8ac5079be97d21bbb9212"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.3.1/colgrep-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "df715e1f0c338718a87d3f5fbaa708c856d9be85b24a35ad2135f52d716c7c78"
    end
  end

  def install
    bin.install "colgrep"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/colgrep --version")
  end
end
