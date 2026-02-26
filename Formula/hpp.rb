class Hpp < Formula
  desc 'CLI tool for searching Japanese restaurants using the HotPepper Gourmet API'
  version '0.1.0'
  homepage 'https://github.com/jackchuka/hpp'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.1.0/hpp_0.1.0_darwin_arm64.tar.gz'
      sha256 'bb54c4664de425dad34563c6ad02c00c7628a4cbbfb78250425ced0733cf120c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.1.0/hpp_0.1.0_darwin_amd64.tar.gz'
      sha256 '6db8614ce978909cdf6dd8cb4555ac276499681c1cab09e7746df6a70411c975'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.1.0/hpp_0.1.0_linux_arm64.tar.gz'
      sha256 '0db10c2df3e14d094cec2b78ab9bfe96aa40dd846b378a1645dcb2aa8e1e5aef'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.1.0/hpp_0.1.0_linux_amd64.tar.gz'
      sha256 '4ac6bde887b9b4475041e4e1a5f69b2df263b2add151c56e94858c1182b870d2'
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
