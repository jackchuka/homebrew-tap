class ConfluenceMd < Formula
  desc '🧭 From Confluence to clean Markdown, images and all — just one command'
  version '0.3.1'
  homepage 'https://github.com/jackchuka/confluence-md'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.1/confluence-md_0.3.1_darwin_arm64.tar.gz'
      sha256 '192e79b7a06ca653e3941c23e7b58b81e008ff97ec2cf50596457126ed64eec2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.1/confluence-md_0.3.1_darwin_amd64.tar.gz'
      sha256 '7da03d81e0c1473158e4d90f631b7ac75c596ffe1860c43ef7518c2801667b6d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.1/confluence-md_0.3.1_linux_arm64.tar.gz'
      sha256 '4d7454015a09f7ff399ab2787a99bb3171c3717bdb575e8ccfee04cbec6dc00b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.1/confluence-md_0.3.1_linux_amd64.tar.gz'
      sha256 'd33bf0ba70d99984ea1fd08ffb9c19accc92c01ac298671b435e66d0f671c21e'
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
