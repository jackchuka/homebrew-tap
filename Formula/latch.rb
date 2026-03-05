class Latch < Formula
  desc 'Task runner with approval gates. Define multi-step command pipelines, gate irreversible actions behind human approval, and optionally schedule them with cron.'
  version '0.2.0'
  homepage 'https://github.com/jackchuka/latch'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/latch/releases/download/v0.2.0/latch_0.2.0_darwin_arm64.tar.gz'
      sha256 '27f813cd2d555f592518972769c6ac526378d76413a12cc2b03812184cb9f770'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.2.0/latch_0.2.0_darwin_amd64.tar.gz'
      sha256 '80e6ff3732e86e3354a3a0df5048724f2e02eed738852fd9c7a0960e41a1dc2a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/latch/releases/download/v0.2.0/latch_0.2.0_linux_arm64.tar.gz'
      sha256 'f1c22e3093feb9b075348febeea77c927e30379e9570b5cc4f9abe5e6ccaca07'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.2.0/latch_0.2.0_linux_amd64.tar.gz'
      sha256 '8d3d9bcb8d3d82562c24f28036ae99ceb798db4b83c455bb3052cdcf0c6d596f'
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
