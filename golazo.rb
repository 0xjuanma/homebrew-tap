class Golazo < Formula
  desc "See football match stats in real-time in your terminal"
  homepage "https://github.com/0xjuanma/golazo"

  version "0.26.0"

  on_macos do
    on_arm do
      url "https://github.com/0xjuanma/golazo/releases/download/v#{version}/golazo-darwin-arm64"
      sha256 "1eac3278b25f9f99325516601ed8dedd31d2c1f801585aff15b0fa93d01f16fb"
    end
    on_intel do
      url "https://github.com/0xjuanma/golazo/releases/download/v#{version}/golazo-darwin-amd64"
      sha256 "319a41fe696887eb5397b6f7a4b54dfe73d94022219c3a37078b131406ef3de0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/0xjuanma/golazo/releases/download/v#{version}/golazo-linux-arm64"
      sha256 "56e351daefb3041bf4ee57f9c8c71c9092d7a087cf28a007ace9e1cf0caf3bd0"
    end
    on_intel do
      url "https://github.com/0xjuanma/golazo/releases/download/v#{version}/golazo-linux-amd64"
      sha256 "828887f5cb9a04ae8daccb0ef5e252ac46d118f298741701a5fcbb401e8b8749"
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
