class Latch < Formula
  desc 'Task runner with approval gates. Define multi-step command pipelines, gate irreversible actions behind human approval, and optionally schedule them with cron.'
  version '0.4.0'
  homepage 'https://github.com/jackchuka/latch'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/latch/releases/download/v0.4.0/latch_0.4.0_darwin_arm64.tar.gz'
      sha256 '15867b3b8b418eb7fe2f859aec7742b7ea9c777196160b4c0277aaaa38aa4c12'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.4.0/latch_0.4.0_darwin_amd64.tar.gz'
      sha256 '4994de6854c0e25801d84332924e853d8b0421e6c6864cb36370779d109cbcb9'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/latch/releases/download/v0.4.0/latch_0.4.0_linux_arm64.tar.gz'
      sha256 '0aff26ed7c7652bfa6ab0a3c6d28231f2756fdeb86309acbe5ee8f1b5fdcffc5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.4.0/latch_0.4.0_linux_amd64.tar.gz'
      sha256 '84a93084e530e5a1ae0b1a1758c8f8ff06ffbb8861925f87470c5b68b2dc358d'
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
