class Latch < Formula
  desc 'Task runner with approval gates. Define multi-step command pipelines, gate irreversible actions behind human approval, and optionally schedule them with cron.'
  version '0.6.0'
  homepage 'https://github.com/jackchuka/latch'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.0/latch_0.6.0_darwin_arm64.tar.gz'
      sha256 'b553614e60cd9f935dfce2296fcc9304f1b08f277bb13544ae5bc8c2a5a296bd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.0/latch_0.6.0_darwin_amd64.tar.gz'
      sha256 '7419f4b4d5c3016d149a9c6df5e2006fe61402277304801a1785e23fadadfee2'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.0/latch_0.6.0_linux_arm64.tar.gz'
      sha256 '10d617a2bcfac9fa22862db447ffe4dcec229d60e093e8d3608931e5b3925ae1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.0/latch_0.6.0_linux_amd64.tar.gz'
      sha256 'f68be10292ea9bad2b556597433029986340ef98800dbd1b9d3e2d881690308a'
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
