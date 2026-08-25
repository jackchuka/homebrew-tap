class ConfluenceMd < Formula
  desc '🧭 From Confluence to clean Markdown, images and all — just one command'
  version '0.3.21'
  homepage 'https://github.com/jackchuka/confluence-md'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.21/confluence-md_0.3.21_darwin_arm64.tar.gz'
      sha256 'a1e089439eaf98fe3487c3d69985b5e61463bcda4d6cce1d40a19d5f3ff398f4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.21/confluence-md_0.3.21_darwin_amd64.tar.gz'
      sha256 '2d91af675b0b7f9ac7f9eb8559ffc78d2646a7e26bb81da12d9543e0eb7b0e1f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.21/confluence-md_0.3.21_linux_arm64.tar.gz'
      sha256 '103105e74614f9c0d0f5876764a735693a5dfed1264845482cada159ca2bcdeb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.21/confluence-md_0.3.21_linux_amd64.tar.gz'
      sha256 '28e95017c4986b85b159c2420b843cac6928b1a8418d6eff0fae09046947b73b'
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
