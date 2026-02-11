class AcpTraces < Formula
  desc "OTel tracing proxy for Agent Client Protocol"
  homepage "https://github.com/AndreKurait/acp-traces"
  license "Apache-2.0"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AndreKurait/acp-traces/releases/download/v0.1.0/acp-traces-macos-arm64"
      sha256 "807136f49ec4d11aad996cbcb777d64b0e0f065e90c5e0e449c845862a883d75"
    else
      url "https://github.com/AndreKurait/acp-traces/releases/download/v0.1.0/acp-traces-macos-amd64"
      sha256 "098ebacebbc5840832b64210d4ff6c6f3b758904c555004e0e91dde8fcdac879"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AndreKurait/acp-traces/releases/download/v0.1.0/acp-traces-linux-arm64"
      sha256 "ce242cb39b51440176e3592fa15b76cfc3b4a0e5407462c23f589c924ddcfd7d"
    else
      url "https://github.com/AndreKurait/acp-traces/releases/download/v0.1.0/acp-traces-linux-amd64"
      sha256 "2d8cba0f1881b0e4565ca91c923fb9b8f22d84dea332253c0b1975eba208d585"
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
