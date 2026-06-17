class ConfluenceMd < Formula
  desc '🧭 From Confluence to clean Markdown, images and all — just one command'
  version '0.3.16'
  homepage 'https://github.com/jackchuka/confluence-md'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.16/confluence-md_0.3.16_darwin_arm64.tar.gz'
      sha256 '3b3129d6a6f39ae30297287721c75f566ec098eb4a9df28e91117b85d36a000d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.16/confluence-md_0.3.16_darwin_amd64.tar.gz'
      sha256 'f867b22af7a9d47e632ebb0e27997371d693a8cc5949b1679ef2162f195598e4'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.16/confluence-md_0.3.16_linux_arm64.tar.gz'
      sha256 '5922483c0740c165ed27d15da01f08bf5a6199e57bcee6452f41e43e40157f43'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.16/confluence-md_0.3.16_linux_amd64.tar.gz'
      sha256 'a7c4d08cac9d0a41e2ecb21babcff189390848a94d5f431afb525cad073cc1f2'
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
