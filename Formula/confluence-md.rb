class ConfluenceMd < Formula
  desc '🧭 From Confluence to clean Markdown, images and all — just one command'
  version '0.3.5'
  homepage 'https://github.com/jackchuka/confluence-md'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.5/confluence-md_0.3.5_darwin_arm64.tar.gz'
      sha256 'f8be8ad27e2793c80fbaa8e999730d077a734d88002544335b20df612429db9b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.5/confluence-md_0.3.5_darwin_amd64.tar.gz'
      sha256 '409c512795c19272e3c7ee976213e382fca28449e6f4f07fcd37abb1282f8a32'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.5/confluence-md_0.3.5_linux_arm64.tar.gz'
      sha256 '967e1d3f208093ba411fac851b2276c4c977842df8d6ae1c50962489984d01e9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.5/confluence-md_0.3.5_linux_amd64.tar.gz'
      sha256 'd5e8181567740814f486d8c94be745d6232257f50745430f82925f25f8d01326'
    end
  end

  head do
    url 'https://github.com/jackchuka/confluence-md.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'confluence-md'
  end
end
