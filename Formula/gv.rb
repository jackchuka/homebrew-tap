class Gv < Formula
  desc 'Git Vision - monitor multiple git repositories'
  version '0.1.7'
  homepage 'https://github.com/jackchuka/gv'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.7/gv_0.1.7_darwin_arm64.tar.gz'
      sha256 '1d34762e4b8eccaebf190ddfbb3c677b9c081c5f214a18435cabfe425ffcefcd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.7/gv_0.1.7_darwin_amd64.tar.gz'
      sha256 '12c8418088a40f8d6bd57e279252c525d440b350a1980a1bef556163ce83c41d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.7/gv_0.1.7_linux_arm64.tar.gz'
      sha256 '465f5fd0cbadaa080dba2b31cd7dd4de9e23a13a28539adbac8070c5d9d9f9f3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.7/gv_0.1.7_linux_amd64.tar.gz'
      sha256 '021eb42e521d27b985200ca79159079a76b12297f4f39aa660f47e3e2f6e44d6'
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
