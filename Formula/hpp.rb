class Hpp < Formula
  desc 'CLI tool for searching Japanese restaurants using the HotPepper Gourmet API'
  version '0.2.2'
  homepage 'https://github.com/jackchuka/hpp'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.2/hpp_0.2.2_darwin_arm64.tar.gz'
      sha256 '3a69da6eefa25b847266572d660cd76e1af1aa2c1aba7406b31d5f210ffd98a3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.2/hpp_0.2.2_darwin_amd64.tar.gz'
      sha256 '821f164d16d1fa5a91bda8753bfa8e7cdacfcf644457d75211495a786c1b7e12'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.2/hpp_0.2.2_linux_arm64.tar.gz'
      sha256 'ccbee883396926395a5285a1af806165334b4c9885c75545a18ab38c4926e8ad'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.2/hpp_0.2.2_linux_amd64.tar.gz'
      sha256 '9c6801de9a06b4da7a92ccc9063ba81c50457ac4dc477d177c5fafcf60c13e15'
    end
  end

  head do
    url 'https://github.com/jackchuka/hpp.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'hpp'
  end
end
