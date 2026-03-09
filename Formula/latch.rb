class Latch < Formula
  desc 'Task runner with approval gates. Define multi-step command pipelines, gate irreversible actions behind human approval, and optionally schedule them with cron.'
  version '0.3.2'
  homepage 'https://github.com/jackchuka/latch'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/latch/releases/download/v0.3.2/latch_0.3.2_darwin_arm64.tar.gz'
      sha256 'a3f7a7a6757383d839c8e58bfcb627c9082c8f10bedc1a837da39388fecdc67f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.3.2/latch_0.3.2_darwin_amd64.tar.gz'
      sha256 '776f4558a61b884cd36f17fb3322cad1426c2b7a10073e69c14ce27fedef1dd2'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/latch/releases/download/v0.3.2/latch_0.3.2_linux_arm64.tar.gz'
      sha256 'b600d8b8c290256ca52ebebb081680a8e92d46b90e25c0582db82e3c86b29c82'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.3.2/latch_0.3.2_linux_amd64.tar.gz'
      sha256 '7bcb4d3885b554f1938960388624ab119314157cf4c1bb6a2c058e270c108816'
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
end
