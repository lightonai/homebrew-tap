class Colgrep < Formula
  desc "Semantic code search powered by ColBERT"
  homepage "https://github.com/lightonai/next-plaid"
  version "1.5.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.5.4/colgrep-aarch64-apple-darwin.tar.xz"
      sha256 "4c26a89a4f540ef54250dec023b76f42fd5379a9de50559d04b4e4f489afb6fc"
    end

    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.5.4/colgrep-x86_64-apple-darwin.tar.xz"
      sha256 "35bdaf58d73fa59ce37e7b271c66d3c41521619d4e3d770ae8b6f9ad6b891bb9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.5.4/colgrep-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "0aef6d21b05f7a9f2f822ed0b51ca97023926ac134c9ba0a7a2ebf510d7412e0"
    end
  end

  def install
    bin.install "colgrep"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/colgrep --version")
  end
end
