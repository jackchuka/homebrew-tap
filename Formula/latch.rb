class Latch < Formula
  desc 'Task runner with approval gates. Define multi-step command pipelines, gate irreversible actions behind human approval, and optionally schedule them with cron.'
  version '0.3.1'
  homepage 'https://github.com/jackchuka/latch'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/latch/releases/download/v0.3.1/latch_0.3.1_darwin_arm64.tar.gz'
      sha256 '1dafac9a9bb7275025036299a96a0707ba928e9b11b81bbc83682d93700d3bb8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.3.1/latch_0.3.1_darwin_amd64.tar.gz'
      sha256 '2f3d8f33cd307be69333f080aba3e6cda9bdd1c4872a6861ebc1bde6d5599d9c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/latch/releases/download/v0.3.1/latch_0.3.1_linux_arm64.tar.gz'
      sha256 '369d6039f1bc8bcf210b8500e04e3aadd93f11ea4782e789d1a23d98427017c4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.3.1/latch_0.3.1_linux_amd64.tar.gz'
      sha256 '2a87797aa37b674e7770b5693bd9aec25507de810ef99e2cb29b320d4806b527'
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
