class Latch < Formula
  desc 'Task runner with approval gates. Define multi-step command pipelines, gate irreversible actions behind human approval, and optionally schedule them with cron.'
  version '0.6.7'
  homepage 'https://github.com/jackchuka/latch'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.7/latch_0.6.7_darwin_arm64.tar.gz'
      sha256 'dce86557269146a888ffcbea1e5c7a46faab54a963b54bd709ca514c4bb1a678'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.7/latch_0.6.7_darwin_amd64.tar.gz'
      sha256 '5e86be35b4e6c3e9aebad9f286582165715b0d1eea798775ef2bd0053fcdac73'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.7/latch_0.6.7_linux_arm64.tar.gz'
      sha256 '5bac458e23faea133125077618e36ecc74270010d213d777b0a86566cedae9d5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.7/latch_0.6.7_linux_amd64.tar.gz'
      sha256 'c53d8de584a4b794534f2b1a5757d70a95ce3593401ca3205824045c53192b68'
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
