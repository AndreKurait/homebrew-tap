class AcpTraces < Formula
  desc "OTel tracing proxy for Agent Client Protocol"
  homepage "https://github.com/AndreKurait/acp-traces"
  license "Apache-2.0"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AndreKurait/acp-traces/releases/download/v#{version}/acp-traces-macos-arm64"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/AndreKurait/acp-traces/releases/download/v#{version}/acp-traces-macos-amd64"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AndreKurait/acp-traces/releases/download/v#{version}/acp-traces-linux-arm64"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/AndreKurait/acp-traces/releases/download/v#{version}/acp-traces-linux-amd64"
      sha256 "PLACEHOLDER"
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
