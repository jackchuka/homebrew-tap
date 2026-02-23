class ConfluenceMd < Formula
  desc '🧭 From Confluence to clean Markdown, images and all — just one command'
  version '0.3.3'
  homepage 'https://github.com/jackchuka/confluence-md'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.3/confluence-md_0.3.3_darwin_arm64.tar.gz'
      sha256 '3a3ec5c08b7f9a4f19fe6340af3f9dc6df1682fb631b260dac660be143001832'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.3/confluence-md_0.3.3_darwin_amd64.tar.gz'
      sha256 '4f7153e2fd273e85c61244e546da02f228d2c855628a33d807c43b3e972b45b3'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.3/confluence-md_0.3.3_linux_arm64.tar.gz'
      sha256 'a7f21a9bac1669ba4f5d1ec8bffe3ea732cf0d03c5fa65ba88aa6471db53f286'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.3/confluence-md_0.3.3_linux_amd64.tar.gz'
      sha256 'eb09a39d18fe8045d06d91d00aced8949b7a397e401f8091e8cc149edd351ac3'
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
