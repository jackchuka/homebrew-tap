class Goalias < Formula
  desc 'Instantly standardize Go import aliases across your entire codebase with LSP-powered precision.'
  version '1.0.6'
  homepage 'https://github.com/jackchuka/goalias'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.6/goalias_1.0.6_darwin_arm64.tar.gz'
      sha256 '5980aea591797f119e57288e76cb6a326c869a876456525ec740b08a4e7a1faf'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.6/goalias_1.0.6_darwin_amd64.tar.gz'
      sha256 'ee60ab301600152f2ad502f8ee6eff84505bfeacc250da30d24d544ed44ea824'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.6/goalias_1.0.6_linux_arm64.tar.gz'
      sha256 'bcb5fdb4b3b8b10d470ebf91fdb18dd26b09a0e759dc78e9a39a89752875dbd7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.6/goalias_1.0.6_linux_amd64.tar.gz'
      sha256 'c71fb9dfd340ea3be09c496ef11c4981d47b947adb1bf7917eab5a005e1033a7'
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
