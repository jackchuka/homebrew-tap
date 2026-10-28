class Gv < Formula
  desc 'Git Vision - monitor multiple git repositories'
  version '0.1.16'
  homepage 'https://github.com/jackchuka/gv'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.16/gv_0.1.16_darwin_arm64.tar.gz'
      sha256 '3a139776dbbdd346df3bd5a80ea04e276c46024a4e0c4c22190d0b85cf2cf4db'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.16/gv_0.1.16_darwin_amd64.tar.gz'
      sha256 '40b975e01c18d628e1902636c9915a5cce6c28b776da137f8bbb88f973485a13'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.16/gv_0.1.16_linux_arm64.tar.gz'
      sha256 'f40ebe7447fb05ff0dd87ccccb0e8163f588aa8f0582162e1270129318870878'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.16/gv_0.1.16_linux_amd64.tar.gz'
      sha256 'd219958e26e92133e13c97ebbca96273c7268e37c8a4aa9d668e6ed0145e572e'
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
