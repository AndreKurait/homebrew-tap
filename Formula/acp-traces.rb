class AcpTraces < Formula
  desc "OTel tracing proxy for Agent Client Protocol"
  homepage "https://github.com/AndreKurait/acp-traces"
  license "Apache-2.0"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AndreKurait/acp-traces/releases/download/v0.3.0/acp-traces-macos-arm64"
      sha256 "8f4e570af95fa0c6a7340547c6134bd55daf2da2baa6a5e54605cd89738e3c12"
    else
      url "https://github.com/AndreKurait/acp-traces/releases/download/v0.3.0/acp-traces-macos-amd64"
      sha256 "797c89ef8da95f0ea4cffff1b42332c93f6e56a92e5c2dfc79a685589b629c9d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AndreKurait/acp-traces/releases/download/v0.3.0/acp-traces-linux-arm64"
      sha256 "c4629d2c5140418da10231efbac399a64f9d0220ca38600edafcd9877d2349ee"
    else
      url "https://github.com/AndreKurait/acp-traces/releases/download/v0.3.0/acp-traces-linux-amd64"
      sha256 "db762072dd38e6e70177217662cfefe04a09db1b2c8e342aec6d9da8689e06e2"
    end
  end

  def install
    binary = Dir.glob("acp-traces-*").first || "acp-traces"
    mv binary, "acp-traces"
    bin.install "acp-traces"
  end

  test do
    assert_match "OTel tracing proxy", shell_output("#{bin}/acp-traces --help")
  end
end
