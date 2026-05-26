class Goalias < Formula
  desc 'Instantly standardize Go import aliases across your entire codebase with LSP-powered precision.'
  version '1.0.8'
  homepage 'https://github.com/jackchuka/goalias'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.8/goalias_1.0.8_darwin_arm64.tar.gz'
      sha256 '31a5b60f80ae9cf6ae1bc813e3c65b2009acff08603359a07f080c3607d0c9c2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.8/goalias_1.0.8_darwin_amd64.tar.gz'
      sha256 'b5036f077e725060e9171131709d89c2b3efcf929e2f9c139ddc397457bd6be3'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.8/goalias_1.0.8_linux_arm64.tar.gz'
      sha256 '912a6a5da34a7435196fde3ff458e8a4fff117fcd292e4d01a912b2daac222c4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.8/goalias_1.0.8_linux_amd64.tar.gz'
      sha256 '86cc7f6f1030de2ec55a6873a09a840a426b20a5522b4b26efce273dc9257847'
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
