class Helm < Formula
  desc "Minimalistic TUI Pomodoro-like timer for pure focus"
  homepage "https://github.com/0xjuanma/helm"
  url "https://github.com/0xjuanma/helm/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "d064cd01965e819398ca16d2169a245bffb7800808280eac80ab813da6f8ceee"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "helm", shell_output("#{bin}/helm --help")
  end
end
