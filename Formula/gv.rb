class Gv < Formula
  desc 'Git Vision - monitor multiple git repositories'
  version '0.1.15'
  homepage 'https://github.com/jackchuka/gv'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.15/gv_0.1.15_darwin_arm64.tar.gz'
      sha256 '8f70a40199a1fcd975a0b44fb57987bf6fbd17ddc7af5faad1364dfcb90447dc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.15/gv_0.1.15_darwin_amd64.tar.gz'
      sha256 '622a9528b9aaff8fc34394957a5b1b30a050104e4b850f9601ac8467ddde82ab'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.15/gv_0.1.15_linux_arm64.tar.gz'
      sha256 'bf66c93ec86ec65beeb72d38e87ff0af964b014ca4cf344e63dcd4d1bf6801ae'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.15/gv_0.1.15_linux_amd64.tar.gz'
      sha256 '587a8c7c443fe0b33be07e76f5450364511fed3f7594d8c0c81ba2eb101d73cb'
    end
  end

  head do
    url 'https://github.com/jackchuka/gv.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'gv'
  end
end
