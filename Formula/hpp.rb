class Hpp < Formula
  desc 'CLI tool for searching Japanese restaurants using the HotPepper Gourmet API'
  version '0.2.9'
  homepage 'https://github.com/jackchuka/hpp'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.9/hpp_0.2.9_darwin_arm64.tar.gz'
      sha256 '1aed55ddbb6ecacbde8a757840b2cb7bb211465ceff92d8cf28ec3f123396068'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.9/hpp_0.2.9_darwin_amd64.tar.gz'
      sha256 '5c9f1332d73c35e5936c1b18aaa6ab29459c7ba923639b284af69898dcad676b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.9/hpp_0.2.9_linux_arm64.tar.gz'
      sha256 '244bc4cffce0af2adae86245d8d9a9c224b81d2842f9198c6b08599d920d98a8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.9/hpp_0.2.9_linux_amd64.tar.gz'
      sha256 '1cbd88146faeebc2ccbebeb1bd61e784070fd87c3bf0ef08da2e55a0e80279c3'
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
