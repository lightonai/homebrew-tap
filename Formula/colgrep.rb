class Colgrep < Formula
  desc "Semantic code search powered by ColBERT"
  homepage "https://github.com/lightonai/next-plaid"
  version "1.8.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.8.4/colgrep-aarch64-apple-darwin.tar.xz"
      sha256 "d2526654e1ea8208f805416ba905a46c9055ff4eff2a0e0f0354afb5842687d9"
    end

    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.8.4/colgrep-x86_64-apple-darwin.tar.xz"
      sha256 "c938bc933d23fede66cc17984619ed81e168e527d97f0be5b5f66f70faa42205"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.8.4/colgrep-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "a2b44a55c9182004d2122155dba0be321ea24479f0de8926f783703ee0638fde"
    end

    on_arm do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.8.4/colgrep-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "80e96b346bd00e53361e5594aae865cf7464f2bf973fb0236783bd2932f539a1"
    end
  end

  def install
    bin.install "colgrep"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/colgrep --version")
  end
end
