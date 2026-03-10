class Colgrep < Formula
  desc "Semantic code search powered by ColBERT"
  homepage "https://github.com/lightonai/next-plaid"
  url "https://github.com/lightonai/next-plaid/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "e9d1a4a1935c401dfcbd5772ad200871800652823f1c80af331cd17f6cf1ff59"
  license "MIT"

  depends_on "rust" => :build

  def install
    features = []

    if OS.mac?
      features << "accelerate"
      features << "coreml" if Hardware::CPU.arm?
    end

    args = ["--release", "--locked", "-p", "colgrep"]
    args += ["--features", features.join(",")] unless features.empty?

    system "cargo", "build", *args
    bin.install "target/release/colgrep"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/colgrep --version")
  end
end
