class Colgrep < Formula
  desc "Semantic code search powered by ColBERT"
  homepage "https://github.com/lightonai/next-plaid"
  version "1.8.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.8.2/colgrep-aarch64-apple-darwin.tar.xz"
      sha256 "3a53befce3113039f7a62f5cc93c5c551f0ba48207644e8ef674534a2cc54fdd"
    end

    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.8.2/colgrep-x86_64-apple-darwin.tar.xz"
      sha256 "dee7ad2e0662d3a32d8ede08fdcfdc6c16b60f2c06a27189c63d107bb47245e8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.8.2/colgrep-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "24a5650125fe027ca315fefaf9e668f967091e571508e55b4c2050c5db4ac5fd"
    end

    on_arm do
      url "https://github.com/lightonai/next-plaid/releases/download/v1.8.2/colgrep-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "51d8ae8b65787099892906594f21885dffd23d78a017ea5d536507538f7c4d30"
    end
  end

  def install
    bin.install "colgrep"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/colgrep --version")
  end
end
