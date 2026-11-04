class ConfluenceMd < Formula
  desc 'From Confluence to clean Markdown, images and all, in one command'
  version '0.3.27'
  homepage 'https://github.com/jackchuka/confluence-md'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.27/confluence-md_0.3.27_darwin_arm64.tar.gz'
      sha256 'edfae46ca34571bedc84335354263201c5dc5d755d5c8549e4829c67e41d5bec'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.27/confluence-md_0.3.27_darwin_amd64.tar.gz'
      sha256 '3db1065b4399bfc0ce59757119b28b6e05a6725de1ee8e360b5dde3316aeed95'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.27/confluence-md_0.3.27_linux_arm64.tar.gz'
      sha256 '2da38d4b7a346fb8326f12a3ee1a336395506d9249c6c98cc4a0aca709ddd7e8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.27/confluence-md_0.3.27_linux_amd64.tar.gz'
      sha256 '5d942fa92fc154ee29c6d7f743053ebd0a2d00e04528fa73a69dec99fe472713'
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
