class Hpp < Formula
  desc 'CLI tool for searching Japanese restaurants using the HotPepper Gourmet API'
  version '0.2.7'
  homepage 'https://github.com/jackchuka/hpp'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.7/hpp_0.2.7_darwin_arm64.tar.gz'
      sha256 'b6c45d3ca7792d2ac7696ef122228807ddb6e4b355a1dfce1a28c7e95ee93d7b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.7/hpp_0.2.7_darwin_amd64.tar.gz'
      sha256 '68d45d683ecdbf05196a8d49d2fafe15dc310f16bac4dee6f65a677a200ac8a2'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.7/hpp_0.2.7_linux_arm64.tar.gz'
      sha256 '3e483da59420d747d8d2f89564a580ff2e99f6985aced37de57fb0d02900dcfa'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.7/hpp_0.2.7_linux_amd64.tar.gz'
      sha256 'b38343a60b332897dc34d81bb1b8031700d5876e636ec4f6be20a294e1cc6ef9'
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
