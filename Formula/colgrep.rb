class Colgrep < Formula
  desc "Semantic code search powered by ColBERT"
  homepage "https://github.com/lightonai/next-plaid"
  version "1.5.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.5.5/colgrep-aarch64-apple-darwin.tar.xz"
      sha256 "0ccbf23cbfdc53e48ba565f77c0785862506d4ff36b153dff565aa99a1bc9531"
    end

    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.5.5/colgrep-x86_64-apple-darwin.tar.xz"
      sha256 "d71b52b58475abf3c47fcbf2760c5b1c60500d38f4667273b4b70cd37108d49d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.5.5/colgrep-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "53b120a7e21c2a5eed1884275d0f99c0d3573aac0ad2019d07b2892b5f3b6759"
    end
  end

  def install
    bin.install "colgrep"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/colgrep --version")
  end
end
