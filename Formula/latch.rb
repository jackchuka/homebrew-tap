class Latch < Formula
  desc 'Task runner with approval gates. Define multi-step command pipelines, gate irreversible actions behind human approval, and optionally schedule them with cron.'
  version '0.6.1'
  homepage 'https://github.com/jackchuka/latch'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.1/latch_0.6.1_darwin_arm64.tar.gz'
      sha256 'bddab979afc9d220aafa44e512750d150cc289e6b1bd0c7ead513a5f6cb8c534'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.1/latch_0.6.1_darwin_amd64.tar.gz'
      sha256 '8b4ec9a966be79ecfdf9d1a4ff8a547503a9b715d8346dc0514af185ac8a366f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.1/latch_0.6.1_linux_arm64.tar.gz'
      sha256 'e361a0c06f8161eae0e535c98317d04da5d13569066d5e1dfda0a90adb845ad3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/latch/releases/download/v0.6.1/latch_0.6.1_linux_amd64.tar.gz'
      sha256 '3589ba5b3b625dd4aa069c62e2acdb6b5db9aec9fe6d9640fc215c3b0c2c4c25'
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
