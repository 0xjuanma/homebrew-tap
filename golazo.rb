class Golazo < Formula
  desc "See football match stats in real-time in your terminal"
  homepage "https://github.com/0xjuanma/golazo"

  version "0.27.0"

  on_macos do
    on_arm do
      url "https://github.com/0xjuanma/golazo/releases/download/v#{version}/golazo-darwin-arm64"
      sha256 "0b9d5deab4c63b1efd4f12f80fafed2b795d705678eda6fdec6b23a4c2007b8e"
    end
    on_intel do
      url "https://github.com/0xjuanma/golazo/releases/download/v#{version}/golazo-darwin-amd64"
      sha256 "68e1a931a468e07c14ddef0715234d32e06e3a7c97c812114a9f77e2a7cb68ef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/0xjuanma/golazo/releases/download/v#{version}/golazo-linux-arm64"
      sha256 "0c01be5f35f46dc376f96d469658b52a20471d58b77771bb9440d46b536bf658"
    end
    on_intel do
      url "https://github.com/0xjuanma/golazo/releases/download/v#{version}/golazo-linux-amd64"
      sha256 "19eaa4cf5f4e9e2142c8300d37e846583575e1001e64e5b84d83879c16fe5d17"
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
