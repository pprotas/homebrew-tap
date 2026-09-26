class Slopbox < Formula
  desc "Development sandbox for coding agents"
  homepage "https://github.com/pprotas/homebrew-tap"
  url "https://github.com/pprotas/homebrew-tap/releases/download/slopbox-v0.1.0/slopbox-0.1.0-darwin-arm64.tar.gz"
  sha256 "66272973f17dc4334010c30d373dc4a64b4aea4fbdb492cee446fbf2f5e2cd2b"
  version "0.1.0"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "slopbox"
  end

  test do
    assert_match "slopbox #{version}", shell_output("#{bin}/slopbox --version")
  end
end
