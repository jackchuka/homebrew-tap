class ConfluenceMd < Formula
  desc '🧭 From Confluence to clean Markdown, images and all — just one command'
  version '0.3.11'
  homepage 'https://github.com/jackchuka/confluence-md'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.11/confluence-md_0.3.11_darwin_arm64.tar.gz'
      sha256 '32bfb7d08863cbbbdcb400037151231e2e165fb9ab9e37939fcdf7a557fc773a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.11/confluence-md_0.3.11_darwin_amd64.tar.gz'
      sha256 '5fbaa9743c14df4804998b82331179e35440e3f686dc5dab741529d6aa1f9df3'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.11/confluence-md_0.3.11_linux_arm64.tar.gz'
      sha256 'e3f9c93f3335cc6b22a0fd24e18e10f96cf5ea2ffffb1f99ab8d6a7f4c9f0aca'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.11/confluence-md_0.3.11_linux_amd64.tar.gz'
      sha256 '2a977ae7e6ea428de1563d90800d987b9395b1886448927d182e8142282e5c5b'
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
