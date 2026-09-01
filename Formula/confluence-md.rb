class ConfluenceMd < Formula
  desc '🧭 From Confluence to clean Markdown, images and all — just one command'
  version '0.3.22'
  homepage 'https://github.com/jackchuka/confluence-md'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.22/confluence-md_0.3.22_darwin_arm64.tar.gz'
      sha256 'f117b3733730a6e68ff3b2221cd8661b18fba056bfd7587213cae31a32e35f74'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.22/confluence-md_0.3.22_darwin_amd64.tar.gz'
      sha256 '0e4a69ee62ebf48fd32be9062543d8a639c3567f87618958d330808c69493998'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.22/confluence-md_0.3.22_linux_arm64.tar.gz'
      sha256 '079bcf07706abc437979ff663fd985b0f2e2004d311f54bb3e3f1eed9b4f4d99'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.22/confluence-md_0.3.22_linux_amd64.tar.gz'
      sha256 '60051f2c028dff36429fd868973b71a56db2e9f5ba896b688ef143e8a72605aa'
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
