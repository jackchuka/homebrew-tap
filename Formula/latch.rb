class Latch < Formula
  desc 'Task runner with approval gates. Define multi-step command pipelines, gate irreversible actions behind human approval, and optionally schedule them with cron.'
  version '0.6.10'
  homepage 'https://github.com/jackchuka/latch'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.10/latch_0.6.10_darwin_arm64.tar.gz'
      sha256 'e0fcce3ee7fc62618ffd00b28944c77d3ef1af1fe900bd338a694c3f41683444'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.10/latch_0.6.10_darwin_amd64.tar.gz'
      sha256 '5b1c29e5dd33ac59cc9d4112d4242504bd1992a514caafb6a56b90563121c0e6'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.10/latch_0.6.10_linux_arm64.tar.gz'
      sha256 'd133eb632bfee7ebba9e121bea920182eadd209d37883ef576ea96046f8e062c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.10/latch_0.6.10_linux_amd64.tar.gz'
      sha256 'd3367a1b5a1bc51e0d2b5d0247a08dc3f8767a4677dca388f6301a1b289811b0'
    end
  end

  head do
    url 'https://github.com/jackchuka/latch.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'latch'
  end

  def post_install
    if OS.mac?
      system 'codesign', '-s', '-', '-i', 'com.latch.cli', '-f', bin/'latch'
    end
  end
end
