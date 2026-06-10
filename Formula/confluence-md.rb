class ConfluenceMd < Formula
  desc '🧭 From Confluence to clean Markdown, images and all — just one command'
  version '0.3.15'
  homepage 'https://github.com/jackchuka/confluence-md'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.15/confluence-md_0.3.15_darwin_arm64.tar.gz'
      sha256 '8a145c7abe851ee7eefbdc92d58e00af18697397c1e92dc77fd22c8df114f86b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.15/confluence-md_0.3.15_darwin_amd64.tar.gz'
      sha256 '1e0fecc58bc12e0227fca50c4ab15ddf61d9fdc4979461dec844672f73d2995b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.15/confluence-md_0.3.15_linux_arm64.tar.gz'
      sha256 '1fc2d278531685f1bf844bb7bbf9aaae790f594d86883bdc2398e723b428261e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.15/confluence-md_0.3.15_linux_amd64.tar.gz'
      sha256 '956482719f47cc833ddfa8733cd2340607cab5594a34ff8d2f7b9727f546e45e'
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
