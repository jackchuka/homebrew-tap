class Latch < Formula
  desc 'Task runner with approval gates. Define multi-step command pipelines, gate irreversible actions behind human approval, and optionally schedule them with cron.'
  version '0.5.0'
  homepage 'https://github.com/jackchuka/latch'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/latch/releases/download/v0.5.0/latch_0.5.0_darwin_arm64.tar.gz'
      sha256 '28f262f642bf90ef6a410695921e1b6fb2a3310956d1315e62333fe2dc68eebd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.5.0/latch_0.5.0_darwin_amd64.tar.gz'
      sha256 '1bd2fad012626a5c58cb41b6cce6647effbf89bd82ccda69b0867663c430db3e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/latch/releases/download/v0.5.0/latch_0.5.0_linux_arm64.tar.gz'
      sha256 'b547eb38677e9d6d049fbc5ab53b64e07417c07160c1c1ee3efe7b97eb4c12e7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.5.0/latch_0.5.0_linux_amd64.tar.gz'
      sha256 'f1c1568629077b4f277a5a9c9a212b49ae67df9ca8077fe4228541dd3018f936'
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
