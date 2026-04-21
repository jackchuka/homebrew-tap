class Latch < Formula
  desc 'Task runner with approval gates. Define multi-step command pipelines, gate irreversible actions behind human approval, and optionally schedule them with cron.'
  version '0.6.2'
  homepage 'https://github.com/jackchuka/latch'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.2/latch_0.6.2_darwin_arm64.tar.gz'
      sha256 'd172b1ed0866dd8b606ecc0f63c39fa061a6bebb0cd7d8cc0e978a6c7211fe6e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.2/latch_0.6.2_darwin_amd64.tar.gz'
      sha256 '4ca8e349ae7e4f42ddbf35cf86f54127371aa6058be9da8fdf4a9916df981142'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.2/latch_0.6.2_linux_arm64.tar.gz'
      sha256 '275edb652e1a3b110dfe7dea958a2d1057ef39a66dc46699232b537fdfffc234'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.2/latch_0.6.2_linux_amd64.tar.gz'
      sha256 '24aeb0fd9d73c51fc532fe0f90562e02f69fe7732092b4ea555bd3cee31f59a8'
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
