class Latch < Formula
  desc 'Task runner with approval gates. Define multi-step command pipelines, gate irreversible actions behind human approval, and optionally schedule them with cron.'
  version '0.6.12'
  homepage 'https://github.com/jackchuka/latch'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.12/latch_0.6.12_darwin_arm64.tar.gz'
      sha256 'b8655169f9104b891703231b61c840573964049e42acf540102328dde513afb3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.12/latch_0.6.12_darwin_amd64.tar.gz'
      sha256 'c6c41e760e0eb121c219cb2a0d38bf373ae2826f89375c8aee598b967cc10464'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.12/latch_0.6.12_linux_arm64.tar.gz'
      sha256 'c5ead49bc51bc77bed3b8053810856ace08db033fc7a7d6597e03695a6145e69'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.12/latch_0.6.12_linux_amd64.tar.gz'
      sha256 '2f859d3ad49d865c5a2b13f37f0f036ac5cce098cad5c05d5618d99bf57f47d6'
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
