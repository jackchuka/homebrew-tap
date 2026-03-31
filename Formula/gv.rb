class Gv < Formula
  desc 'Git Vision - monitor multiple git repositories'
  version '0.1.5'
  homepage 'https://github.com/jackchuka/gv'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.5/gv_0.1.5_darwin_arm64.tar.gz'
      sha256 'f8a819b90c5c74fb8901fa5a5a4ca57a32584c90c39c1a135cc78880a3562f60'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.5/gv_0.1.5_darwin_amd64.tar.gz'
      sha256 'da3f8f1d54e2734abd1548395197fd1d1bb5946cd710483e3caa91f94938978c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.5/gv_0.1.5_linux_arm64.tar.gz'
      sha256 '59d80691b6d3e9be6ea898087a67842fb616493e7ae61d6d25cb53de877ec1c2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.5/gv_0.1.5_linux_amd64.tar.gz'
      sha256 '04cd918b74124ccb9e2aea0e3e513673293a21d7bd9ec62377085c273a141937'
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
