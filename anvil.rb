class Anvil < Formula
  desc "CLI to streamline config management and tool installation"
  homepage "https://github.com/0xjuanma/anvil"

  version "2.9.0"

  on_macos do
    on_arm do
      url "https://github.com/0xjuanma/anvil/releases/download/v#{version}/anvil-darwin-arm64"
      sha256 "4b49a789394a4dd3206b02e40871ed51c12b8416ae8f2ed91df14f835cc9c93a"
    end
    on_intel do
      url "https://github.com/0xjuanma/anvil/releases/download/v#{version}/anvil-darwin-amd64"
      sha256 "c9738f9f8988cd45943f37bfed0686cb591ec762f217f04d1579da00ee36514c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/0xjuanma/anvil/releases/download/v#{version}/anvil-linux-arm64"
      sha256 "e167fd2935ec838ff0581288c342c08d28e907c80c0d68f5d406f9ae5975c53f"
    end
    on_intel do
      url "https://github.com/0xjuanma/anvil/releases/download/v#{version}/anvil-linux-amd64"
      sha256 "a8922783cbe612b780f4102d19dcec57dc265d973f8b1f400c102d1fe6f54813"
    end
  end

  def install
    arch = Hardware::CPU.arch.to_s.sub("x86_64", "amd64")
    bin.install "#{name}-#{OS.kernel_name.downcase}-#{arch}" => name
  end

  test do
    system "#{bin}/anvil", "--version"
  end
end
