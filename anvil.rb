class Anvil < Formula
  desc "CLI to streamline config management and tool installation"
  homepage "https://github.com/0xjuanma/anvil"

  version "2.8.0"

  on_macos do
    on_arm do
      url "https://github.com/0xjuanma/anvil/releases/download/v#{version}/anvil-darwin-arm64"
      sha256 "441779716159036a4383b943fe06677ead8964f3040964eab91ff8a8ce6b81ca"
    end
    on_intel do
      url "https://github.com/0xjuanma/anvil/releases/download/v#{version}/anvil-darwin-amd64"
      sha256 "33bbc801b8b92af2d05e591fc83105d060d894138f4fc7bb3a95fea1f9833320"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/0xjuanma/anvil/releases/download/v#{version}/anvil-linux-arm64"
      sha256 "71158697ca26be601969d14d12b787eb3ba277d1b31c74de6954162c8968af25"
    end
    on_intel do
      url "https://github.com/0xjuanma/anvil/releases/download/v#{version}/anvil-linux-amd64"
      sha256 "0f07a4bc0b2e4d82ce409b97029a00b0b3eeca8fba5e5c084ae68c36b8fb69b9"
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
