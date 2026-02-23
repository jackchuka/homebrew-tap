class Gv < Formula
  desc 'Git Vision - monitor multiple git repositories'
  version '0.1.2'
  homepage 'https://github.com/jackchuka/gv'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.2/gv_0.1.2_darwin_arm64.tar.gz'
      sha256 '2fbc5d64215c3236d8ffb3360b625617d9dc3195eab447eb66eb61e015aebb2a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.2/gv_0.1.2_darwin_amd64.tar.gz'
      sha256 '55fb9856216fb3f36cf6a6a88a83c883978fe33057334ee9b8bef5bdeaa98bac'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.2/gv_0.1.2_linux_arm64.tar.gz'
      sha256 '3da25c955c093bb9caeb6e25f42820f9d0959eecabf56513a262f06447db52aa'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.2/gv_0.1.2_linux_amd64.tar.gz'
      sha256 'ab31fd20b8989fe5a7e9248b24e964ed2d73905c7023a698b76dc48b5548024d'
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
