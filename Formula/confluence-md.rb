class ConfluenceMd < Formula
  desc '🧭 From Confluence to clean Markdown, images and all — just one command'
  version '0.3.8'
  homepage 'https://github.com/jackchuka/confluence-md'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.8/confluence-md_0.3.8_darwin_arm64.tar.gz'
      sha256 '3c55cc7843b080faf7e127e0f00212a3bbc64d7731bf936e273e3ee2ab183d80'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.8/confluence-md_0.3.8_darwin_amd64.tar.gz'
      sha256 '9acb7ea13e177a23026c01c4ca19559974d679a11cab0e7a341ec9d999218a4e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.8/confluence-md_0.3.8_linux_arm64.tar.gz'
      sha256 'ea33ef121b851506724a4e682535a6f7182f958f28841d2b9a1063cd7dd8d503'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.8/confluence-md_0.3.8_linux_amd64.tar.gz'
      sha256 'd0adea364ca81b00fcf71327bf8f0c332b683fb6a41c6e87a26af8e5d4e3be48'
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
