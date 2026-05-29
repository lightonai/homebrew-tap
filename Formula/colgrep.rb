class Colgrep < Formula
  desc "Semantic code search powered by ColBERT"
  homepage "https://github.com/lightonai/next-plaid"
  version "1.5.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.5.0/colgrep-aarch64-apple-darwin.tar.xz"
      sha256 "681d8158bf95dce163af5300bfd18bfa85a83b5ba03c30d7a4ea151bca67ac53"
    end

    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.5.0/colgrep-x86_64-apple-darwin.tar.xz"
      sha256 "8940e9a45ef845061f6e8f870dad703fcc9f8168c3b712d5c35a15da79a45be6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.5.0/colgrep-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "d7a3d48a989dbce5371a67e4f5bbd086fbaf1f84a766a36a01995e4d944e9481"
    end
  end

  def install
    bin.install "colgrep"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/colgrep --version")
  end
end
