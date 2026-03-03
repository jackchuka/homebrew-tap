class Gv < Formula
  desc 'Git Vision - monitor multiple git repositories'
  version '0.1.3'
  homepage 'https://github.com/jackchuka/gv'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.3/gv_0.1.3_darwin_arm64.tar.gz'
      sha256 '7f6b5fc7548ea19af587d150dba5955b23ca73f3267ea72ee8dfcf0a27a2c705'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.3/gv_0.1.3_darwin_amd64.tar.gz'
      sha256 '687ae9f11ab55bd19c866fb45f50f20fcb99ab90bc6338655f082f589300f5f5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.3/gv_0.1.3_linux_arm64.tar.gz'
      sha256 'b3868642ceb0785e02ec6d84a5efc07bf3186b2864b4d692ae20e8c62fbe936c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.3/gv_0.1.3_linux_amd64.tar.gz'
      sha256 'f4274bb21dfb639e05ad811c51cfd2c2e3b786adbb3c32d3ecd5b39f076bf8f2'
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
