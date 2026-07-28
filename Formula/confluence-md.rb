class ConfluenceMd < Formula
  desc '🧭 From Confluence to clean Markdown, images and all — just one command'
  version '0.3.19'
  homepage 'https://github.com/jackchuka/confluence-md'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.19/confluence-md_0.3.19_darwin_arm64.tar.gz'
      sha256 'cd7a985a8d10b40c0ffbdaed0c7c845565150efc22aa2be2e871ccda7a67e0e7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.19/confluence-md_0.3.19_darwin_amd64.tar.gz'
      sha256 '35b6222f40b5e57d7563aa240c6032b41e25930274ccf51217a6f917be0f6957'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.19/confluence-md_0.3.19_linux_arm64.tar.gz'
      sha256 'f9ffd401fc5b4758f4dcbdb289c978aec898344c301e34e4fb6d50dce9b407ef'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.19/confluence-md_0.3.19_linux_amd64.tar.gz'
      sha256 'f18cafd95447c3754fc09303489e3f5c2281d0edf23e21d2dfa7825a97803e05'
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
