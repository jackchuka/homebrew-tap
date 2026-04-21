class Hpp < Formula
  desc 'CLI tool for searching Japanese restaurants using the HotPepper Gourmet API'
  version '0.2.3'
  homepage 'https://github.com/jackchuka/hpp'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.3/hpp_0.2.3_darwin_arm64.tar.gz'
      sha256 '819403562cbec6acb716bc74263894558c6c7690288bec9942ac64a41fd9d1a7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.3/hpp_0.2.3_darwin_amd64.tar.gz'
      sha256 'b510ac0e86cdb1cbf7a2dd583c0979b6ca0585d82a09d14f92d8de3b62284284'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.3/hpp_0.2.3_linux_arm64.tar.gz'
      sha256 '8501f5bd930f0dbf3abfdfdbc3775f9bf4d45a77fe39818e1652e1a3ebb412ba'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.3/hpp_0.2.3_linux_amd64.tar.gz'
      sha256 '87fc3f7009ef44f7892b1fffe45855f5778c8f742286c5387fd46260c934dfc8'
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
