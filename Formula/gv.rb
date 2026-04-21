class Gv < Formula
  desc 'Git Vision - monitor multiple git repositories'
  version '0.1.6'
  homepage 'https://github.com/jackchuka/gv'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.6/gv_0.1.6_darwin_arm64.tar.gz'
      sha256 '14a3d017e7b25def6a58814b1a691a21474e3072f5d4ae99c0ab11e99b5c5829'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.6/gv_0.1.6_darwin_amd64.tar.gz'
      sha256 '0829f0dd8bef5860851f1ce7169dc2fbc052e3667ad974a8e1bb5f14118e3659'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.6/gv_0.1.6_linux_arm64.tar.gz'
      sha256 '6ed4155ca149cb82d8fc50951ff7ec754af2a640c7da5fad15271c0bcfbba1bc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.6/gv_0.1.6_linux_amd64.tar.gz'
      sha256 '62bf49cf35e40c1723452705324c556122500c3d2ca5e4e5c4a64a0f22fc0b24'
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
