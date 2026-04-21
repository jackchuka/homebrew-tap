class ConfluenceMd < Formula
  desc '🧭 From Confluence to clean Markdown, images and all — just one command'
  version '0.3.10'
  homepage 'https://github.com/jackchuka/confluence-md'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.10/confluence-md_0.3.10_darwin_arm64.tar.gz'
      sha256 'b6b8c7aa98e6a721426922621d077527c233e952582caea19af7b68ce0fc1a32'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.10/confluence-md_0.3.10_darwin_amd64.tar.gz'
      sha256 '710e895f748ab42d33bcce8ef9e1dfa23860cb89f58fe7e0849733d12d4b82f2'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.10/confluence-md_0.3.10_linux_arm64.tar.gz'
      sha256 '01b2b5fe844c788e4dc905690312834b456ceb3dc3e7e3c149a19f9621331ad6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.10/confluence-md_0.3.10_linux_amd64.tar.gz'
      sha256 '150c63322de833b30b0aa82a19751f569d45e3b6e85b35fb1f9483ab91827562'
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
