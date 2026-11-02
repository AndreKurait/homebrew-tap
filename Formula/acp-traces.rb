class AcpTraces < Formula
  desc "Experimental OpenTelemetry tracing proxy for Agent Client Protocol"
  homepage "https://github.com/AndreKurait/acp-traces"
  license "Apache-2.0"
  version "0.3.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AndreKurait/acp-traces/releases/download/v0.3.1/acp-traces-macos-arm64"
      sha256 "f3644580ea93b01704dc28c17df2da2b022df356eb2dcb7af072dbb8424e2f31"
    else
      url "https://github.com/AndreKurait/acp-traces/releases/download/v0.3.1/acp-traces-macos-amd64"
      sha256 "34365a86d939976a27f69581358514a7f1dfd4995d5da9ee5c8b11f78a259980"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AndreKurait/acp-traces/releases/download/v0.3.1/acp-traces-linux-arm64"
      sha256 "0989442eb4bad3ad6636d72fb4c119f02a00082908800fb7f21cb208496f51c7"
    else
      url "https://github.com/AndreKurait/acp-traces/releases/download/v0.3.1/acp-traces-linux-amd64"
      sha256 "3f8ec17606701ac665bbd51861ca48d71a16ca9691f98b8eec7a7f0706e00d5f"
    end
  end

  def install
    binary = Dir.glob("acp-traces-*").first || "acp-traces"
    mv binary, "acp-traces"
    bin.install "acp-traces"
  end

  test do
    assert_match "acp-traces #{version}", shell_output("#{bin}/acp-traces --version")
    assert_match "OTel tracing proxy", shell_output("#{bin}/acp-traces --help")
  end
end
