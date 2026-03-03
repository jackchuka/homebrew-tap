class ConfluenceMd < Formula
  desc '🧭 From Confluence to clean Markdown, images and all — just one command'
  version '0.3.4'
  homepage 'https://github.com/jackchuka/confluence-md'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.4/confluence-md_0.3.4_darwin_arm64.tar.gz'
      sha256 'e7a45cb7e422210b4f83a55380260969b3ac913f1473bd5cc3e650dfec352637'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.4/confluence-md_0.3.4_darwin_amd64.tar.gz'
      sha256 'aa70953a3b7139dbd3b5dd54cb4c6a03abea7346e35ee8ab7312d2bfdbc697a3'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.4/confluence-md_0.3.4_linux_arm64.tar.gz'
      sha256 'eabdb117e16553a1b6a03fe57890f49f245bb68295e7cdee1503f4724e59b694'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.4/confluence-md_0.3.4_linux_amd64.tar.gz'
      sha256 '109deda6c3a7b738567ea0f42dec3f5e6640ea11b46b7a13ca2dc081ba2befdf'
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
