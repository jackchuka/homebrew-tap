class ConfluenceMd < Formula
  desc '🧭 From Confluence to clean Markdown, images and all — just one command'
  version '0.3.9'
  homepage 'https://github.com/jackchuka/confluence-md'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.9/confluence-md_0.3.9_darwin_arm64.tar.gz'
      sha256 '8def71c583acf59b8547342cd7befb469369c33e4104c7f4df9b70968b88428a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.9/confluence-md_0.3.9_darwin_amd64.tar.gz'
      sha256 '38391132b760842b1683991b31d4aa2670bb20fe632d52fbad0e7dc1578eb0db'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.9/confluence-md_0.3.9_linux_arm64.tar.gz'
      sha256 '209fbbec02025fad5db4da0a3192c8f95115e68b099f4810848d1eccc67f05dd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.9/confluence-md_0.3.9_linux_amd64.tar.gz'
      sha256 'f95ba3c54b73c43e1c6e0b8f18cd1a1fce586e33d356d0e7a0117aa2eb6b520b'
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
