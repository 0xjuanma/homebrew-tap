class Helm < Formula
  desc "Minimalistic TUI Pomodoro-like timer for pure focus"
  homepage "https://github.com/0xjuanma/helm"

  version "0.7.0"

  on_macos do
    on_arm do
      url "https://github.com/0xjuanma/helm/releases/download/v#{version}/helm-darwin-arm64"
      sha256 "97c6e028390b2c4d696aacd998eec698bbec34661ff33064d54c8946c555a943"
    end
    on_intel do
      url "https://github.com/0xjuanma/helm/releases/download/v#{version}/helm-darwin-amd64"
      sha256 "7eaf14144201f25d556eb1a768e46bbaf9cbbf59a42b7390451ce2c3af366c61"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/0xjuanma/helm/releases/download/v#{version}/helm-linux-arm64"
      sha256 "7933676f3f2116c6a2eedbec729f21af1e326e1ed53f39c7d9b89dd77e482055"
    end
    on_intel do
      url "https://github.com/0xjuanma/helm/releases/download/v#{version}/helm-linux-amd64"
      sha256 "7829fa6c3c3c6a38d6970bb34b065fb900b73c879aa3ea067fb1eb5a35213589"
    end
  end

  def install
    arch = Hardware::CPU.arch.to_s.sub("x86_64", "amd64")
    bin.install "#{name}-#{OS.kernel_name.downcase}-#{arch}" => name
  end

  test do
    assert_match "helm", shell_output("#{bin}/helm --help")
  end
end
