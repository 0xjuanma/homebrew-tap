class Golazo < Formula
  desc "See football match stats in real-time in your terminal"
  homepage "https://github.com/0xjuanma/golazo"

  version "0.29.1"

  on_macos do
    on_arm do
      url "https://github.com/0xjuanma/golazo/releases/download/v#{version}/golazo-darwin-arm64"
      sha256 "706b206840c5f95711fe923840183a0b1b0f1c6939057efbb8c91139d25a0dc5"
    end
    on_intel do
      url "https://github.com/0xjuanma/golazo/releases/download/v#{version}/golazo-darwin-amd64"
      sha256 "57c9e4dd610216977de8f16ff8d3f0264e80f9021984fc1650ac39b3854fbd51"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/0xjuanma/golazo/releases/download/v#{version}/golazo-linux-arm64"
      sha256 "f42c57f424cd49af639095d098643173690e2fb4e23c3ac693f36a43600ee285"
    end
    on_intel do
      url "https://github.com/0xjuanma/golazo/releases/download/v#{version}/golazo-linux-amd64"
      sha256 "5c97f4aee0baa58e56c38c05f92193256cd0dfb61654eae36154914bac5eff94"
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
