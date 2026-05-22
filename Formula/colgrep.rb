class Colgrep < Formula
  desc "Semantic code search powered by ColBERT"
  homepage "https://github.com/lightonai/next-plaid"
  version "1.4.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.4.0/colgrep-aarch64-apple-darwin.tar.xz"
      sha256 "b3fef3fa852737905dcfe74f387616ccd870218f2a4601a3fe5e3b337d835fe7"
    end

    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.4.0/colgrep-x86_64-apple-darwin.tar.xz"
      sha256 "a6cd31ce927d08933a74246779cd689e3f12a37097d6faff8e1b8d2ecbf10b80"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.4.0/colgrep-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "1fd083b78f16445b588ba50d02e115e47476568cbda5100170edb1539f892c07"
    end
  end

  def install
    bin.install "colgrep"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/colgrep --version")
  end
end
