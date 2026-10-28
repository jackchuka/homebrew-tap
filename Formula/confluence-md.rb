class ConfluenceMd < Formula
  desc 'From Confluence to clean Markdown, images and all, in one command'
  version '0.3.26'
  homepage 'https://github.com/jackchuka/confluence-md'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.26/confluence-md_0.3.26_darwin_arm64.tar.gz'
      sha256 '3112b3c82fe48f9db8cad2f7bf4be7ce528e5ea092bf4bfca654c69f5ebe1b70'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.26/confluence-md_0.3.26_darwin_amd64.tar.gz'
      sha256 '1e581dcd8f928e51f3649b726d82aa1c87fa9b8950027d71f168a1e2ecfa08b2'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.26/confluence-md_0.3.26_linux_arm64.tar.gz'
      sha256 '53c6ad0a322deebdfe30638a208ad378f80cb9af2a93ee543005f1b6c97d88fb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.26/confluence-md_0.3.26_linux_amd64.tar.gz'
      sha256 '4129366dce4ed508570f183eeee54b490d18f3d065a984ac9651df99ce166168'
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
