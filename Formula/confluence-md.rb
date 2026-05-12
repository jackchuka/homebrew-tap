class ConfluenceMd < Formula
  desc '🧭 From Confluence to clean Markdown, images and all — just one command'
  version '0.3.12'
  homepage 'https://github.com/jackchuka/confluence-md'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.12/confluence-md_0.3.12_darwin_arm64.tar.gz'
      sha256 '58c91c03d989e714aecc14b41c65ab5afbbd27d147140fb9b4377b7a8b430795'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.12/confluence-md_0.3.12_darwin_amd64.tar.gz'
      sha256 '633f08b82e6aa8ce6f1013f93c6a75dedd7d342336404fbf7195481fe2d0048a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.12/confluence-md_0.3.12_linux_arm64.tar.gz'
      sha256 '3da6ce2e98ac23cba8073af35112615b0de3aee47a12bdc717828ce99ed340b8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.12/confluence-md_0.3.12_linux_amd64.tar.gz'
      sha256 'b376263447eb66ed9cf8fd2138dad75e50a932787e69997398d26d67d9333b7b'
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
