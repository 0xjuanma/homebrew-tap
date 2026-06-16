class Golazo < Formula
  desc "See football match stats in real-time in your terminal"
  homepage "https://github.com/0xjuanma/golazo"

  version "0.29.0"

  on_macos do
    on_arm do
      url "https://github.com/0xjuanma/golazo/releases/download/v#{version}/golazo-darwin-arm64"
      sha256 "b435f9bb378d8920b27ac2c5d24f6d2e9b6d110719d5b256881263f20108f96b"
    end
    on_intel do
      url "https://github.com/0xjuanma/golazo/releases/download/v#{version}/golazo-darwin-amd64"
      sha256 "d39fdf9ae8fe3ef2b03e3d5efb1e7033460d3db15813a14b4c9c9364fad7e079"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/0xjuanma/golazo/releases/download/v#{version}/golazo-linux-arm64"
      sha256 "b79489b4e7ed85b1f7f9b0cb4fa6c56dded8612f79d8c7361285b3bb467beb74"
    end
    on_intel do
      url "https://github.com/0xjuanma/golazo/releases/download/v#{version}/golazo-linux-amd64"
      sha256 "315539f91d619847cc9280d5aac45a2d92243f063f1b636ddbf323899e96b2a7"
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
