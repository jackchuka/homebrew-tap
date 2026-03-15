class Gv < Formula
  desc 'Git Vision - monitor multiple git repositories'
  version '0.1.4'
  homepage 'https://github.com/jackchuka/gv'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.4/gv_0.1.4_darwin_arm64.tar.gz'
      sha256 '2a1df4d24840254b25263dbd166b59f0bed5c62ca80530aefcc6710886b6c24c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.4/gv_0.1.4_darwin_amd64.tar.gz'
      sha256 'd180cf7ef75ce583e719be9343b56a7d4adc0c107ba1da1cddeed6d7bcc5d6cb'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.4/gv_0.1.4_linux_arm64.tar.gz'
      sha256 '0df2dab19ca1b93fb5908ff5fe7216faf0d8e37a1de937e1419f55d7f0502b21'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.4/gv_0.1.4_linux_amd64.tar.gz'
      sha256 '3cf00d250bd33e58b730972a5c1986e6d1451370b95d3d5a94239a9ef27a2fa9'
    end
  end

  head do
    url 'https://github.com/jackchuka/gv.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'gv'
  end
end
