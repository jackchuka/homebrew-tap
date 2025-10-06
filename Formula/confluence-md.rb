class ConfluenceMd < Formula
  desc '🧭 From Confluence to clean Markdown, images and all — just one command'
  version '0.2.0'
  homepage 'https://github.com/jackchuka/confluence-md'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.2.0/confluence-md_0.2.0_darwin_arm64.tar.gz'
      sha256 'c8a7ab52384209da9858947448ec419ddeeeb77d751bdfac3f3120d43566fabc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.2.0/confluence-md_0.2.0_darwin_amd64.tar.gz'
      sha256 'da40189901ff8201c27862b40999a8c7e965468ba59e7ff5f1a076793662c853'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.2.0/confluence-md_0.2.0_linux_arm64.tar.gz'
      sha256 '39848af3013bea59e1864618c1f0ced520cfd7ffdf197668e0e917309b6e1640'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.2.0/confluence-md_0.2.0_linux_amd64.tar.gz'
      sha256 'd3e6f1afbd235fbcda1d1248db3564926d8aa5e1efe5b688f563a746edfaeec6'
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
