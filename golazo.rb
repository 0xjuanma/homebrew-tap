class Golazo < Formula
  desc "See football match stats in real-time in your terminal"
  homepage "https://github.com/0xjuanma/golazo"

  version "0.15.0"

  on_macos do
    on_arm do
      url "https://github.com/0xjuanma/golazo/releases/download/v#{version}/golazo-darwin-arm64"
      sha256 "115188ec0a8e9afb1c4cb70cd8f4ab1d68bd40991dc934d52542ccf438158f44"
    end
    on_intel do
      url "https://github.com/0xjuanma/golazo/releases/download/v#{version}/golazo-darwin-amd64"
      sha256 "d3ba90f780144b13b3a343257ca5213e60c7e8099b07608c02e0bbba18ab67e5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/0xjuanma/golazo/releases/download/v#{version}/golazo-linux-arm64"
      sha256 "1370964d4c66680a183c9d23d5a990558479f903c1b153e589fec9f72112340c"
    end
    on_intel do
      url "https://github.com/0xjuanma/golazo/releases/download/v#{version}/golazo-linux-amd64"
      sha256 "2b808f31a088d834ce54215490adf097f0742e5e5ce67006f968f886d980fc4f"
    end
  end

  def install
    bin.install "#{name}-#{OS.kernel_name.downcase}-#{Hardware::CPU.arch}" => name
  end

  test do
    system "#{bin}/golazo", "--version"
  end
end
