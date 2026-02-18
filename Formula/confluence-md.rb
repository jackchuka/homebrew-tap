class ConfluenceMd < Formula
  desc '🧭 From Confluence to clean Markdown, images and all — just one command'
  version '0.3.2'
  homepage 'https://github.com/jackchuka/confluence-md'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.2/confluence-md_0.3.2_darwin_arm64.tar.gz'
      sha256 '345595d5bf27bfa626dc4b21159e8732fd9a092cfc2771ff579d2534df4b44cf'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.2/confluence-md_0.3.2_darwin_amd64.tar.gz'
      sha256 '4534678bed54d317c16a359961f66d12ff0069e287380af6ade037ab0dac7c39'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.2/confluence-md_0.3.2_linux_arm64.tar.gz'
      sha256 'aba45ca27d6700349a421710499634d364a119cec1667040e73236994931018b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.2/confluence-md_0.3.2_linux_amd64.tar.gz'
      sha256 '108398d68191cb381a31933dfc35d61130921d16b9fb04f118ba1bbf7e3d276e'
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
