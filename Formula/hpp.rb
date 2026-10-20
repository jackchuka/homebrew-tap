class Hpp < Formula
  desc 'CLI tool for searching Japanese restaurants using the HotPepper Gourmet API'
  version '0.2.10'
  homepage 'https://github.com/jackchuka/hpp'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.10/hpp_0.2.10_darwin_arm64.tar.gz'
      sha256 '67c408ccf0199a98c38c5f80a24d8cd9ebcda0acedea9866aae22feb59abbfd0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.10/hpp_0.2.10_darwin_amd64.tar.gz'
      sha256 '69f02784f48dddf08a215f63361918d2482cfcf59170a5b92064153cdd50aac1'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.10/hpp_0.2.10_linux_arm64.tar.gz'
      sha256 '72604a044deebfb3c7835df8476c5f9be8c58d4dd4a9e764c7f5f7cd64451200'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.10/hpp_0.2.10_linux_amd64.tar.gz'
      sha256 '10e2992e77ae48fd57823df303e6917fb8953efd22085edf85c26e740ad9ed02'
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
