class Gv < Formula
  desc 'Git Vision - monitor multiple git repositories'
  version '0.1.0'
  homepage 'https://github.com/jackchuka/gv'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.0/gv_0.1.0_darwin_arm64.tar.gz'
      sha256 '25e080dada02b84c740f75bbbf61f3ff45ceb6b431283e1a80732cada0b8bd4f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.0/gv_0.1.0_darwin_amd64.tar.gz'
      sha256 '1ff29714576b60192aee778eee29df55d15442c116ee50332474d26a54f6f90a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.0/gv_0.1.0_linux_arm64.tar.gz'
      sha256 'fa1209737b1652f32fb0e5288e3ca162d9259bf954df4c1ba4dbf8ee6da93c6b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.0/gv_0.1.0_linux_amd64.tar.gz'
      sha256 'aaf5ae2aa553b6ee9c5f559dc90cbfd41a650e17c412963db8ceae6a4c6bfaca'
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
