class Latch < Formula
  desc 'Task runner with approval gates. Define multi-step command pipelines, gate irreversible actions behind human approval, and optionally schedule them with cron.'
  version '0.6.9'
  homepage 'https://github.com/jackchuka/latch'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.9/latch_0.6.9_darwin_arm64.tar.gz'
      sha256 'd73d65f91ae9c53117970c8ef329ed1eb64b9d49a7f48b85739958c098b3a161'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.9/latch_0.6.9_darwin_amd64.tar.gz'
      sha256 '86bd04723b393251ee7e336808745a3e70cc4c82c67cbf7c0b6adb34e659af03'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.9/latch_0.6.9_linux_arm64.tar.gz'
      sha256 '3789dc927869bb5ec7c40a96a668eb017cdbba7a69fc02d7f4bf79abf098481a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.9/latch_0.6.9_linux_amd64.tar.gz'
      sha256 'c46f9d62aabe6832580db9918be37fa285e7a236b27819a4aef8a36af4ebf4ae'
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
