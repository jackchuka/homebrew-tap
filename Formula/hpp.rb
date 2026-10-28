class Hpp < Formula
  desc 'CLI tool for searching Japanese restaurants using the HotPepper Gourmet API'
  version '0.2.11'
  homepage 'https://github.com/jackchuka/hpp'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.11/hpp_0.2.11_darwin_arm64.tar.gz'
      sha256 '3c707c064968ceace0122483c678066db9795f8a2f5b0b9999c50abf77a09453'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.11/hpp_0.2.11_darwin_amd64.tar.gz'
      sha256 '41fc0c888350cdc77e7a8069c6ffd7f7bce5a27a1c6a48ac30288b78456c25f7'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.11/hpp_0.2.11_linux_arm64.tar.gz'
      sha256 '055d01995e858a3b5cf3a41ef7fde716dd95be727624354e9fe7603a1d2630ce'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.11/hpp_0.2.11_linux_amd64.tar.gz'
      sha256 '474cbaae4c09052f60a2c1425f657b8b0cbd302cc31db6d6d79c7a29b82475e2'
    end
  end

  head do
    url 'https://github.com/jackchuka/hpp.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'hpp'
  end
end
