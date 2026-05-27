class ConfluenceMd < Formula
  desc '🧭 From Confluence to clean Markdown, images and all — just one command'
  version '0.3.14'
  homepage 'https://github.com/jackchuka/confluence-md'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.14/confluence-md_0.3.14_darwin_arm64.tar.gz'
      sha256 '7cf47ef8ee576a5d26425e41e80800a0f3ae300a577ae15b9b0beaf28a196dfb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.14/confluence-md_0.3.14_darwin_amd64.tar.gz'
      sha256 'fcb6f18fd5964e57f02f90ba6d7ed66e15b5ec9535994b214abf0bf431a322b0'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.14/confluence-md_0.3.14_linux_arm64.tar.gz'
      sha256 '05671d7c45383e1d6a0852f53e67875a35a817aadd84daa8fa5c4c8e4e740e49'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.14/confluence-md_0.3.14_linux_amd64.tar.gz'
      sha256 '90417722921c3939db566d5134fce68f98a228476cd2acae181d39545a564956'
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
