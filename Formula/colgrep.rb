class Colgrep < Formula
  desc "Semantic code search powered by ColBERT"
  homepage "https://github.com/lightonai/next-plaid"
  version "1.0.8"
  license "MIT"

  # Source tarball (used for building from source as fallback)
  url "https://github.com/lightonai/next-plaid/archive/refs/tags/v#{version}.tar.gz"
  sha256 "c2abd04683d9e0ed30e7fb29b3e8d09cdc83863ada52d69e938ec1d2dc3153fa"

  # Prebuilt binaries per platform
  on_macos do
    on_arm do
      resource "binary" do
        url "https://github.com/lightonai/next-plaid/releases/download/v#{version}/colgrep-aarch64-apple-darwin.tar.xz"
        sha256 "a81ffd067428548dfb384224f98a35ef4c8e828f923562acef1e6d5fe1544517"
      end
    end

    on_intel do
      resource "binary" do
        url "https://github.com/lightonai/next-plaid/releases/download/v#{version}/colgrep-x86_64-apple-darwin.tar.xz"
        sha256 "9cf9dbcf1840bd8227ac64596aa6a4733a7b6b10498820c5b9307e4a0df641b6"
      end
    end
  end

  on_linux do
    on_intel do
      resource "binary" do
        url "https://github.com/lightonai/next-plaid/releases/download/v#{version}/colgrep-x86_64-unknown-linux-gnu.tar.xz"
        sha256 "d397ce5cc5928fd4d762eeecbb0629f9c7689ab1e71ec7403c21218ae0612b27"
      end
    end
  end

  # Rust is only needed when building from source (no prebuilt binary available)
  depends_on "rust" => :build

  def install
    # Try to use prebuilt binary first
    if resources.key?("binary")
      binary_installed = install_prebuilt_binary
      return if binary_installed
    end

    # Fall back to building from source
    ohai "No prebuilt binary available, building from source..."
    install_from_source
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/colgrep --version")
  end

  private

  def install_prebuilt_binary
    resource("binary").stage do
      # Binary is inside a directory named colgrep-{target}/
      binary = Dir["*/colgrep"].first
      if binary && File.exist?(binary)
        bin.install binary
        return true
      end
    end
    false
  rescue => e
    opoo "Failed to install prebuilt binary (#{e.message}), falling back to source build"
    false
  end

  def install_from_source
    features = []

    if OS.mac?
      features << "accelerate"
      features << "coreml" if Hardware::CPU.arm?
    end

    args = ["--release", "-p", "colgrep"]
    args += ["--features", features.join(",")] unless features.empty?

    system "cargo", "build", *args
    bin.install "target/release/colgrep"
  end
end
