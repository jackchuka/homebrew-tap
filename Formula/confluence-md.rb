class ConfluenceMd < Formula
  desc '🧭 From Confluence to clean Markdown, images and all — just one command'
  version '0.3.13'
  homepage 'https://github.com/jackchuka/confluence-md'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.13/confluence-md_0.3.13_darwin_arm64.tar.gz'
      sha256 '21adf0d4e085fd33b6bc3c8338dbd3a018f64218772913f590363faa1316b3d1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.13/confluence-md_0.3.13_darwin_amd64.tar.gz'
      sha256 'f991e684a387621b0e1e1a41352741278ee4bd0ccbcbebab42e5269afbabad3d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.13/confluence-md_0.3.13_linux_arm64.tar.gz'
      sha256 '9496fed07721ff9198fa60d331b511ed2ff1017553898db9a670340fbf0aba68'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.13/confluence-md_0.3.13_linux_amd64.tar.gz'
      sha256 '2972ed1a5f13bc3e97ebd5cf1245c002494498ecb18abb38ad10d76c3b5e0e1f'
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
