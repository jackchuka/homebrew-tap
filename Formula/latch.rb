class Latch < Formula
  desc 'Task runner with approval gates. Define multi-step command pipelines, gate irreversible actions behind human approval, and optionally schedule them with cron.'
  version '0.1.0'
  homepage 'https://github.com/jackchuka/latch'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/latch/releases/download/v0.1.0/latch_0.1.0_darwin_arm64.tar.gz'
      sha256 'b4cbd1e03496cf1102dc7af4e536c21e29f640b3518b5d154b12b99fc4851aa5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.1.0/latch_0.1.0_darwin_amd64.tar.gz'
      sha256 'a351206f65cbc694faf6db1240b93f12197184c8a05cbac818ac6e811e8a8e3e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/latch/releases/download/v0.1.0/latch_0.1.0_linux_arm64.tar.gz'
      sha256 'bef4a40c473c6d8271f3860eff30b2aaf6f262cab9301821d1c36af2fdde4a0b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.1.0/latch_0.1.0_linux_amd64.tar.gz'
      sha256 'cb02903ea59d4db1bf222f1f6488574e8530686789302c300888947f102a7f73'
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
