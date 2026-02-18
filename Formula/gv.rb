class Gv < Formula
  desc 'Git Vision - monitor multiple git repositories'
  version '0.1.1'
  homepage 'https://github.com/jackchuka/gv'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.1/gv_0.1.1_darwin_arm64.tar.gz'
      sha256 '2386f6e06d703c14bef49fef6e7a18dfec30333ada48e65edaa583c9d691ee4c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.1/gv_0.1.1_darwin_amd64.tar.gz'
      sha256 '326d2a8322ea8b39ac8723701ec7d5f0747e1cba9c10cbc17576213d09973c2b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.1/gv_0.1.1_linux_arm64.tar.gz'
      sha256 '4f3b03b765543d0c77793e84eeaa5862fd83296a32e9c1155330594616347b2f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.1/gv_0.1.1_linux_amd64.tar.gz'
      sha256 'c4eb4c992e940bb63536d2d78b32490cdaf08cbe07b056d8d3c014fe0e2b2e6d'
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
