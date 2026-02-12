class AcpTraces < Formula
  desc "OTel tracing proxy for Agent Client Protocol"
  homepage "https://github.com/AndreKurait/acp-traces"
  license "Apache-2.0"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AndreKurait/acp-traces/releases/download/v0.2.0/acp-traces-macos-arm64"
      sha256 "3fe093a561e6e26681d3cc5720afc2d7fc3b1ef24077dec55cb337196bc7dac4"
    else
      url "https://github.com/AndreKurait/acp-traces/releases/download/v0.2.0/acp-traces-macos-amd64"
      sha256 "3ba8e2c7c0aa45e291fb1c429d7ad824da4283f3ddb6f72f66bacc19e0289914"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AndreKurait/acp-traces/releases/download/v0.2.0/acp-traces-linux-arm64"
      sha256 "6527fbeb07a418e9685e56421c3681cb48587927d4072400a9678ad018558010"
    else
      url "https://github.com/AndreKurait/acp-traces/releases/download/v0.2.0/acp-traces-linux-amd64"
      sha256 "3ba9fbc417a8a0640b18f04df0c34ce934a2e7111a1bb65f5b559a2857813d44"
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
