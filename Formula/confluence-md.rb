class ConfluenceMd < Formula
  desc '🧭 From Confluence to clean Markdown, images and all — just one command'
  version '0.3.6'
  homepage 'https://github.com/jackchuka/confluence-md'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.6/confluence-md_0.3.6_darwin_arm64.tar.gz'
      sha256 '16f2de51f660b34a022812be15c16bbbbd201293d829e45e535fe6bb3628a87a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.6/confluence-md_0.3.6_darwin_amd64.tar.gz'
      sha256 'b25b6efb489a5a2b00c9278dfce798bd582678b1d98a6d72916f66384b82095d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.6/confluence-md_0.3.6_linux_arm64.tar.gz'
      sha256 'ab979963c43c463e694ead8200ec358da89c5abe3bbadc323c48b09fee463bed'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.6/confluence-md_0.3.6_linux_amd64.tar.gz'
      sha256 'f1041fe9f67d8fbd32343d439e9919c18733cc35de86e284453aa10c81f9375c'
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
