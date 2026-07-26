class Helm < Formula
  desc "Minimalistic TUI Pomodoro-like timer for pure focus"
  homepage "https://github.com/0xjuanma/helm"

  version "0.8.0"

  on_macos do
    on_arm do
      url "https://github.com/0xjuanma/helm/releases/download/v#{version}/helm-darwin-arm64"
      sha256 "9c1c2df3ab614176d0f52fbe3aa43c985d40bbc5f2cd91c2be19e7fdb50e411d"
    end
    on_intel do
      url "https://github.com/0xjuanma/helm/releases/download/v#{version}/helm-darwin-amd64"
      sha256 "c7242ef724adcc8815e663ec32ce1adce77220737113d64cc37d197b865c5ff4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/0xjuanma/helm/releases/download/v#{version}/helm-linux-arm64"
      sha256 "9b7d07d2bcade3c47e26407313ec2e16f2ef69b57f2ebe576e08eec925cf9427"
    end
    on_intel do
      url "https://github.com/0xjuanma/helm/releases/download/v#{version}/helm-linux-amd64"
      sha256 "0d89bd62a84fabf687cc6576755fc1fa49064729a2d126482a7880bd5911ac79"
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
