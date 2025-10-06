class Goalias < Formula
  desc 'Instantly standardize Go import aliases across your entire codebase with LSP-powered precision.'
  version '1.0.1'
  homepage 'https://github.com/jackchuka/goalias'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.1/goalias_1.0.1_darwin_arm64.tar.gz'
      sha256 'b744b5b2f6f035c35aa8f05b4c47a09b580d57d39d269567149ac8e268fc81ee'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.1/goalias_1.0.1_darwin_amd64.tar.gz'
      sha256 'fbd2ddc9a48e63040a6ef25c667d38c360707cad54f271cb5911c53494a529a4'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.1/goalias_1.0.1_linux_arm64.tar.gz'
      sha256 'cfd8538ea495c8247545ab0de0ef2c60b172361c495c75d38bcea185bbbff240'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.1/goalias_1.0.1_linux_amd64.tar.gz'
      sha256 '9ce5492970c36723a96437fb177ce1d3181c6351a08ca31a2dd10cb1037992a9'
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
