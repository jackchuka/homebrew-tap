class ConfluenceMd < Formula
  desc '🧭 From Confluence to clean Markdown, images and all — just one command'
  version '0.3.17'
  homepage 'https://github.com/jackchuka/confluence-md'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.17/confluence-md_0.3.17_darwin_arm64.tar.gz'
      sha256 'b239afa6342f64877fe6e62c16e3d8b80b201f440afadc45c5181ca81f09a261'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.17/confluence-md_0.3.17_darwin_amd64.tar.gz'
      sha256 'a041dad119b3a245e05af428226d111beae1bc35924217eb3c6d2f60f20ee37b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.17/confluence-md_0.3.17_linux_arm64.tar.gz'
      sha256 'a95ab8ab782d99dffb096f76b42b947b5f10f0fb59f8802f886c0e0786d2bfb0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.17/confluence-md_0.3.17_linux_amd64.tar.gz'
      sha256 'f4aba76514313d65af450f9c72bee7e4dc2b8eba9db6a06373634e3b1b538bb8'
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
