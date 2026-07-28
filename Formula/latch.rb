class Latch < Formula
  desc 'Task runner with approval gates. Define multi-step command pipelines, gate irreversible actions behind human approval, and optionally schedule them with cron.'
  version '0.6.8'
  homepage 'https://github.com/jackchuka/latch'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.8/latch_0.6.8_darwin_arm64.tar.gz'
      sha256 '1393927b0b05c4e12169c312487890b411138f91a705dac0094d7e361e0f5008'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.8/latch_0.6.8_darwin_amd64.tar.gz'
      sha256 '07ce4fc3c1d254596a38a83ab31ef1f35a60bd92a57d0a836d51c07e2428597a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.8/latch_0.6.8_linux_arm64.tar.gz'
      sha256 '4bc99283e488197e2daa3a0a125cbe57cf6a65600001c717a33b3dc88c029f11'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.8/latch_0.6.8_linux_amd64.tar.gz'
      sha256 '8663d6a0db4493e8884e6d6836afb2c3582d012866b1ac41e5abbaa3b7ad4592'
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
