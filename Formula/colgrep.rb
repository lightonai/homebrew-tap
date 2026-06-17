class Colgrep < Formula
  desc "Semantic code search powered by ColBERT"
  homepage "https://github.com/lightonai/next-plaid"
  version "1.5.7"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.5.7/colgrep-aarch64-apple-darwin.tar.xz"
      sha256 "5f8c71d76be66d17ad63e4d2f874aeb559d75088556aac266d6e1c838beaf881"
    end

    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.5.7/colgrep-x86_64-apple-darwin.tar.xz"
      sha256 "7afee589eb107cef2eeda8da0aaf753c48b34f696161293f7eddd4242be2eff8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.5.7/colgrep-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "d9d6263cfba5673b2272877de2b70d474c70cae28d3d5e6fd03bd3d331e23510"
    end
  end

  def install
    bin.install "colgrep"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/colgrep --version")
  end
end
