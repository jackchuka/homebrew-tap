class ConfluenceMd < Formula
  desc '🧭 From Confluence to clean Markdown, images and all — just one command'
  version '0.3.23'
  homepage 'https://github.com/jackchuka/confluence-md'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.23/confluence-md_0.3.23_darwin_arm64.tar.gz'
      sha256 '59bee3ef8d9dfb24c114d7d830178c6c6df5e2648329fa07161f8ae5882656cc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.23/confluence-md_0.3.23_darwin_amd64.tar.gz'
      sha256 'ceb22ee3aa1cf2523688a3544feb7a015f7a3c8102b56c8e3834765d342d6301'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.23/confluence-md_0.3.23_linux_arm64.tar.gz'
      sha256 'f00688ce4b6939f4b7777b30d97160a9c6d2c03cb6892df6e235055fbd1aca08'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.23/confluence-md_0.3.23_linux_amd64.tar.gz'
      sha256 '78733af2d7a634c7efc3ddd7530df3a81c540968d23c4dd188d91e8034e157a1'
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
