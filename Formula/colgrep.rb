class Colgrep < Formula
  desc "Semantic code search powered by ColBERT"
  homepage "https://github.com/lightonai/next-plaid"
  version "1.6.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.6.2/colgrep-aarch64-apple-darwin.tar.xz"
      sha256 "717e06464eae15b12c322fc9a9188bc8e5fb2a7ef0b2779f457b8f1fb78a9334"
    end

    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.6.2/colgrep-x86_64-apple-darwin.tar.xz"
      sha256 "3dbab9b9504331000a53b01d2765a803752dc16fabc4a0d8c6de249ccb836d59"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.6.2/colgrep-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "28aff55c44680a07c39d7e9e58949de3c90b270abcfede56709930b7d2cd5860"
    end
  end

  def install
    bin.install "colgrep"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/colgrep --version")
  end
end
