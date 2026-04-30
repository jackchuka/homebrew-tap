class Latch < Formula
  desc 'Task runner with approval gates. Define multi-step command pipelines, gate irreversible actions behind human approval, and optionally schedule them with cron.'
  version '0.6.3'
  homepage 'https://github.com/jackchuka/latch'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.3/latch_0.6.3_darwin_arm64.tar.gz'
      sha256 '16e8b17d7b67a0ffc6792c2cc8dfa27dd7589208e3ea05c6efe112db90049f4a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.3/latch_0.6.3_darwin_amd64.tar.gz'
      sha256 '772e9115d6f747d569b24f4dcaac63d5f6da5eab1b06cc8776f3a92ce7e92c2a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.3/latch_0.6.3_linux_arm64.tar.gz'
      sha256 'c22dd755bc06b28a038a8489f926c87ba7e4f1ae2966a2b48fd947401b418703'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.3/latch_0.6.3_linux_amd64.tar.gz'
      sha256 'b263451ab836158f0a28f6a64da33bed6452950702b68b02dd11d7661b7fcb43'
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
