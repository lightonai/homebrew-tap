class Colgrep < Formula
  desc "Semantic code search powered by ColBERT"
  homepage "https://github.com/lightonai/next-plaid"
  version "1.6.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.6.5/colgrep-aarch64-apple-darwin.tar.xz"
      sha256 "d6a6f86f76cf24f6608555b73747debf0d41d5a73e0eb446b0b1b3e5be40713b"
    end

    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.6.5/colgrep-x86_64-apple-darwin.tar.xz"
      sha256 "ba44080aa11eb3ca0b4e34de049e766067bfa1919eb0147de63e2c907377c030"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.6.5/colgrep-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "fe6471aa163fce0c4c42d907d6a3c33c8d44bcdcf7879cd3097f29953193d186"
    end
  end

  def install
    bin.install "colgrep"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/colgrep --version")
  end
end
