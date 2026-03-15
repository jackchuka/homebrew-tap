class Latch < Formula
  desc 'Task runner with approval gates. Define multi-step command pipelines, gate irreversible actions behind human approval, and optionally schedule them with cron.'
  version '0.5.1'
  homepage 'https://github.com/jackchuka/latch'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/latch/releases/download/v0.5.1/latch_0.5.1_darwin_arm64.tar.gz'
      sha256 '5a90b0ebb1aa7aeb0504d68c774f5a4325297115879065be11331976ffa11945'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.5.1/latch_0.5.1_darwin_amd64.tar.gz'
      sha256 '191218cb73ced5956227054e627952ad419be28583b568e434cf84e9ed33a410'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/latch/releases/download/v0.5.1/latch_0.5.1_linux_arm64.tar.gz'
      sha256 '418b232e557c4164f016c9ae9e440d76fbc5db43d19a94c0b40b5ccd7c68570a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.5.1/latch_0.5.1_linux_amd64.tar.gz'
      sha256 '19ab1e73a87759006a0f99176819e6a3798fd80a205fa88ee9eca2fcf71bcb1a'
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
