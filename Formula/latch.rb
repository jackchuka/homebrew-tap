class Latch < Formula
  desc 'Task runner with approval gates. Define multi-step command pipelines, gate irreversible actions behind human approval, and optionally schedule them with cron.'
  version '0.6.4'
  homepage 'https://github.com/jackchuka/latch'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.4/latch_0.6.4_darwin_arm64.tar.gz'
      sha256 '7eea376088c0a4b9442915d57b38c1e1b75f3e126746ead4f108dd4dc9f4b77f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.4/latch_0.6.4_darwin_amd64.tar.gz'
      sha256 'af36843463a4bbea36064858295ee603721f8e293820aec2970f41fe02873c27'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.4/latch_0.6.4_linux_arm64.tar.gz'
      sha256 '486053caefd426216c6cf4bae5febd11b16a87657c778efd09bc7a600826b498'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.4/latch_0.6.4_linux_amd64.tar.gz'
      sha256 'f0f13e38d7e7d3e0969550529133c92f03a80c9df2254084affb71c56700ada8'
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
