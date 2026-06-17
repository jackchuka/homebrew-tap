class Goalias < Formula
  desc 'Instantly standardize Go import aliases across your entire codebase with LSP-powered precision.'
  version '1.0.9'
  homepage 'https://github.com/jackchuka/goalias'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.9/goalias_1.0.9_darwin_arm64.tar.gz'
      sha256 'a31406a21ceb4166d9ca6c0d39d60e01a52bf4acd2cf3df51ac6e597a0a16e1f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.9/goalias_1.0.9_darwin_amd64.tar.gz'
      sha256 'be5d154e3961a907ef9cfd3ba519c878e56a08ab66f78f1fa28f0d1f79ed74c4'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.9/goalias_1.0.9_linux_arm64.tar.gz'
      sha256 '8b5d483d352058ac9b6f8ea36d12bfd5603d0f2000f55af831f0c466132ce260'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.9/goalias_1.0.9_linux_amd64.tar.gz'
      sha256 '1e57c5a919ca782a6e137e24e6ddc5ebf36b189a9571352f326ba5d3cb83974e'
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
