class Colgrep < Formula
  desc "Semantic code search powered by ColBERT"
  homepage "https://github.com/lightonai/next-plaid"
  version "1.6.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.6.0/colgrep-aarch64-apple-darwin.tar.xz"
      sha256 "7a51c3a185eb1b0ef9ee51de2c3e11ad1ba0ea998c043d9afbe0c6adcdf2b9f5"
    end

    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.6.0/colgrep-x86_64-apple-darwin.tar.xz"
      sha256 "8bd6a56790c958a0b09c73ca23d494c93e67e7af60539655711bd1d9f4e27416"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.6.0/colgrep-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "250aa728bc5b0dcec4fb24ca97788b18e58686809b6c189c6b7b29f3e52de323"
    end
  end

  def install
    bin.install "colgrep"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/colgrep --version")
  end
end
