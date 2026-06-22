class Goalias < Formula
  desc 'Instantly standardize Go import aliases across your entire codebase with LSP-powered precision.'
  version '1.0.10'
  homepage 'https://github.com/jackchuka/goalias'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.10/goalias_1.0.10_darwin_arm64.tar.gz'
      sha256 '4990e3b7cae867a5d87efc4ade5b3966ca31e4d11a7bbb6ccf9f9cc0aa3fc301'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.10/goalias_1.0.10_darwin_amd64.tar.gz'
      sha256 'e9b29ee8e322fa6f8ace5fe9a866fd64422987504bde2beaad5e44f3ada1c314'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.10/goalias_1.0.10_linux_arm64.tar.gz'
      sha256 '5c4202cbb8cb9aad79df51a3d8d4795db7338a01e5fdd79baf5de99c3dc57c4f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.10/goalias_1.0.10_linux_amd64.tar.gz'
      sha256 '99f1c6ecfc61d9b577999c8c8ad8f7147b62fe2784934dcc7d0b58d3f95008d0'
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
