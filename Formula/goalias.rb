class Goalias < Formula
  desc 'Instantly standardize Go import aliases across your entire codebase with LSP-powered precision.'
  version '1.0.7'
  homepage 'https://github.com/jackchuka/goalias'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.7/goalias_1.0.7_darwin_arm64.tar.gz'
      sha256 'abbff56eb95d5f189ae448eb84b32c443254aeecf69f956092ce1ad30d50872b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.7/goalias_1.0.7_darwin_amd64.tar.gz'
      sha256 'a008579b7de810520cc3e98b7a0dac99311679af27e5be1ae6853c4eb9404230'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.7/goalias_1.0.7_linux_arm64.tar.gz'
      sha256 'd7dd100601fcbac7a3c050124f9cca53a32438191b7b883e3555ddd0e8c4ac1a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.7/goalias_1.0.7_linux_amd64.tar.gz'
      sha256 'd351fcf90a00faa1014c07430e9805217c720b0837aafbe622d47322309a0ad3'
    end
  end

  head do
    url 'https://github.com/jackchuka/goalias.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'goalias'
  end
end
