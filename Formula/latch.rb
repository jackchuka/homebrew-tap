class Latch < Formula
  desc 'Task runner with approval gates. Define multi-step command pipelines, gate irreversible actions behind human approval, and optionally schedule them with cron.'
  version '0.3.0'
  homepage 'https://github.com/jackchuka/latch'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/latch/releases/download/v0.3.0/latch_0.3.0_darwin_arm64.tar.gz'
      sha256 '236bd48327bb9700e577d376165eac6089c055c55db045a47bfa414db6fd22c5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.3.0/latch_0.3.0_darwin_amd64.tar.gz'
      sha256 'fb48041ed2662c2ea0a5d06c39d709051bb7e32d388081eb352c2c38452da75f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/latch/releases/download/v0.3.0/latch_0.3.0_linux_arm64.tar.gz'
      sha256 '6e727be6e98373f0fd6348d42f62afea67b5d24bd264e02b9caeef2ec5b8e612'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.3.0/latch_0.3.0_linux_amd64.tar.gz'
      sha256 '9b94f117b19ceefda66ce2dd0fe5f0288252177c8a6115dbfa7f5b3ca59b981c'
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
