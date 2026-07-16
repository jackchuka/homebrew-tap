class Latch < Formula
  desc 'Task runner with approval gates. Define multi-step command pipelines, gate irreversible actions behind human approval, and optionally schedule them with cron.'
  version '0.6.6'
  homepage 'https://github.com/jackchuka/latch'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.6/latch_0.6.6_darwin_arm64.tar.gz'
      sha256 'a08c38c1be23eb64616c89a81e0b06610c82c53e538026b0cf7ad928830ba547'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.6/latch_0.6.6_darwin_amd64.tar.gz'
      sha256 '0718ebe1fae60011e5c869b1bdbf784640fa754ca3d5bfa68c849f3767bbc12e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.6/latch_0.6.6_linux_arm64.tar.gz'
      sha256 '9411c8dcf2241f9b4a8a35f8f6718c36222176a49d96904d2434cb48c72e52cf'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.6/latch_0.6.6_linux_amd64.tar.gz'
      sha256 '475530241011ce098274f61092e872af8bced94340ee82b513b8ed3580a48b96'
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
