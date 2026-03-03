class Goalias < Formula
  desc 'Instantly standardize Go import aliases across your entire codebase with LSP-powered precision.'
  version '1.0.3'
  homepage 'https://github.com/jackchuka/goalias'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.3/goalias_1.0.3_darwin_arm64.tar.gz'
      sha256 '98b2f8c1483ebc578925176c181b9095f6c9f522fbb8303b342fa9ea50eb7f7c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.3/goalias_1.0.3_darwin_amd64.tar.gz'
      sha256 'd08f9bae9393499099153d3b12f76315410e3845dd4f41357ef3e272856ef102'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.3/goalias_1.0.3_linux_arm64.tar.gz'
      sha256 'a877cb7187083f74868b1bb77e0dd961c7aefa833ee0e8b111d3d0d56f2934b8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.3/goalias_1.0.3_linux_amd64.tar.gz'
      sha256 '6aa2cae770df14bed112e3c56f219e851a9f5b32906dab95d2bc6d97b27c3940'
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
