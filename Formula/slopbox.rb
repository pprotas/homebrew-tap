class Slopbox < Formula
  desc "Development sandbox for coding agents"
  homepage "https://github.com/pprotas/homebrew-tap"
  url "https://github.com/pprotas/homebrew-tap/releases/download/slopbox-v0.2.0/slopbox-0.2.0-darwin-arm64.tar.gz"
  sha256 "9af0eb10693ef85fe07e44619c48deb938164fc16fd59a65a51b78148e3633a2"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "slopbox"
  end

  test do
    assert_match "slopbox #{version}", shell_output("#{bin}/slopbox --version")
  end
end
