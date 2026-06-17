class Latch < Formula
  desc 'Task runner with approval gates. Define multi-step command pipelines, gate irreversible actions behind human approval, and optionally schedule them with cron.'
  version '0.6.5'
  homepage 'https://github.com/jackchuka/latch'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.5/latch_0.6.5_darwin_arm64.tar.gz'
      sha256 'c72f96399892fe39c903f3c21c69c731d375a532d8b1b3eb74c3d17108411b8c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.5/latch_0.6.5_darwin_amd64.tar.gz'
      sha256 '63416b3602f3fd2ae3b3901c77b3222416be9d8644634dba625334a74a53753d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.5/latch_0.6.5_linux_arm64.tar.gz'
      sha256 '3a9b6e3d4edeae41872c04802387b4c4e121fd79d8aaddba516330516a127796'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.5/latch_0.6.5_linux_amd64.tar.gz'
      sha256 'c30fcbcd0eaf002568024795d8308499386ee3d9671cdc54009bc8814ca629fb'
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
