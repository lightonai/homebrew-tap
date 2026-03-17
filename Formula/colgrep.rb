class Colgrep < Formula
  desc "Semantic code search powered by ColBERT"
  homepage "https://github.com/lightonai/next-plaid"
  version "1.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.1.1/colgrep-aarch64-apple-darwin.tar.xz"
      sha256 "4facd57eb113fbb4f5d21d78bf3a61551844263b8afe62290a56c5f96503e2c7"
    end

    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.1.1/colgrep-x86_64-apple-darwin.tar.xz"
      sha256 "3330f4dbbf95b82087e603407afec11ce76512f0d9abe6cc7411695082496758"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.1.1/colgrep-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "97a5a605244b3cd85a66dc1e4a59ba0c3b46c5afe368548a28f7cfc6b28b5703"
    end
  end

  def install
    bin.install "colgrep"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/colgrep --version")
  end
end
