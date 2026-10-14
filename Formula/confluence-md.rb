class ConfluenceMd < Formula
  desc 'From Confluence to clean Markdown, images and all, in one command'
  version '0.3.24'
  homepage 'https://github.com/jackchuka/confluence-md'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.24/confluence-md_0.3.24_darwin_arm64.tar.gz'
      sha256 '4afd0ed764dafcf32c2539243f82968a3f9e31a5718ad68d103c651c50a12d16'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.24/confluence-md_0.3.24_darwin_amd64.tar.gz'
      sha256 'cf7b597a2d54e06d1060808eb88d05f2ac3016d0ee432bcc9cdeb42a897b6ce7'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.24/confluence-md_0.3.24_linux_arm64.tar.gz'
      sha256 'ffe8d2bb2ec3abdcc28122b4a58ce6a51c726e8d370dcb89ca0fde40369b7c9e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.24/confluence-md_0.3.24_linux_amd64.tar.gz'
      sha256 'ba67de6c6e4a1e9ca98d85cf004978c275c14d9f43eb95f15e170a5e038e3214'
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
