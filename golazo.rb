class Golazo < Formula
  desc "See football match stats in real-time in your terminal"
  homepage "https://github.com/0xjuanma/golazo"

  version "0.31.0"

  on_macos do
    on_arm do
      url "https://github.com/0xjuanma/golazo/releases/download/v#{version}/golazo-darwin-arm64"
      sha256 "5a3d2488878a4252a7c62b581f7be0bc62a5145d8debdc84443ac73ac7a194af"
    end
    on_intel do
      url "https://github.com/0xjuanma/golazo/releases/download/v#{version}/golazo-darwin-amd64"
      sha256 "f56402b4e881423396f0a84a324a03605b741a8150582ffe007808f786e2ae0d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/0xjuanma/golazo/releases/download/v#{version}/golazo-linux-arm64"
      sha256 "579a5a0978ffb4adb613db58f92cdc2ee86d54281d226b2ba6d86d751750109d"
    end
    on_intel do
      url "https://github.com/0xjuanma/golazo/releases/download/v#{version}/golazo-linux-amd64"
      sha256 "7a8c6a0a0b4185bd519a0f6350d4342911e52a10c63eb1498fb81e130b4ba49e"
    end
  end

  def install
    arch = Hardware::CPU.arch.to_s.sub("x86_64", "amd64")
    bin.install "#{name}-#{OS.kernel_name.downcase}-#{arch}" => name
  end

  test do
    system "#{bin}/golazo", "--version"
  end
end
