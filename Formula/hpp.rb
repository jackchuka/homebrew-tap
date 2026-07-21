class Hpp < Formula
  desc 'CLI tool for searching Japanese restaurants using the HotPepper Gourmet API'
  version '0.2.8'
  homepage 'https://github.com/jackchuka/hpp'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.8/hpp_0.2.8_darwin_arm64.tar.gz'
      sha256 'ae648c976f4339a867d82f73a6798a6d111dee28866020264acb4e85e62c9460'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.8/hpp_0.2.8_darwin_amd64.tar.gz'
      sha256 '1d91f81f6f3fb270364eaf358fcefc774e4785f179e9f04e53b856a9a8508829'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.8/hpp_0.2.8_linux_arm64.tar.gz'
      sha256 '18c8f556c363c26ce976527ce865db18f2b24004f228efe3cdfe85327979322b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.8/hpp_0.2.8_linux_amd64.tar.gz'
      sha256 'd8201bada44fe5ffc8943e3336c7a35ce0563de413d94f2eb161c9e53c0c89f7'
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
