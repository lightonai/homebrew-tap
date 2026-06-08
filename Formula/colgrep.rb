class Colgrep < Formula
  desc "Semantic code search powered by ColBERT"
  homepage "https://github.com/lightonai/next-plaid"
  version "1.5.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.5.3/colgrep-aarch64-apple-darwin.tar.xz"
      sha256 "0c59a1682e82f8b778c57da3c031f0abcad20e1ec444f64634470bf2fcdaec62"
    end

    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.5.3/colgrep-x86_64-apple-darwin.tar.xz"
      sha256 "707ba9494e17404029a70d8cbac6404510fdcfd44f52f96e2258cd3dc865db47"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.5.3/colgrep-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "1b2f1ad8ff5dab87cd3d43ad446d42b721504bb05366513b3c9da57cba5a17e5"
    end
  end

  def install
    bin.install "colgrep"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/colgrep --version")
  end
end
