class Latch < Formula
  desc 'Task runner with approval gates. Define multi-step command pipelines, gate irreversible actions behind human approval, and optionally schedule them with cron.'
  version '0.6.11'
  homepage 'https://github.com/jackchuka/latch'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.11/latch_0.6.11_darwin_arm64.tar.gz'
      sha256 '7052415790f2f74eef4d52eac9f3df25dc8661f01a48f605c836058d22751762'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.11/latch_0.6.11_darwin_amd64.tar.gz'
      sha256 '3b3b2e38fc3cf02048715e038a7401ddab5ca1cd83cdc4b5f2f87232ba2a7f66'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.11/latch_0.6.11_linux_arm64.tar.gz'
      sha256 'dcf8274c95f04551320775fa4ac573cb15517a59749fe403f0c7609a5648c81b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.11/latch_0.6.11_linux_amd64.tar.gz'
      sha256 'c1f0e44691243578a3ff9f4e90082311fc89ed157570a97c7acbbd139f5c2a04'
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
