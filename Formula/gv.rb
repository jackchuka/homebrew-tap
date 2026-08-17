class Gv < Formula
  desc 'Git Vision - monitor multiple git repositories'
  version '0.1.13'
  homepage 'https://github.com/jackchuka/gv'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.13/gv_0.1.13_darwin_arm64.tar.gz'
      sha256 'a645cc8145207075d4a5a6d2a3ce8a4773cfe6de1b5324c77eb27be8f631de07'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.13/gv_0.1.13_darwin_amd64.tar.gz'
      sha256 '699931e043407f5a78fc410de028228e3140aa8678fc845a92f6966c933acfe5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.13/gv_0.1.13_linux_arm64.tar.gz'
      sha256 'e929b4c3e687179cf325c059f25d5f886966dfc43e3df769cec2249bf7f9e9d1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.13/gv_0.1.13_linux_amd64.tar.gz'
      sha256 '6aa2983bdb34384add94d45b00f340b8f6fe95dd9c48ccfe0d5d1ac2461b8048'
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
