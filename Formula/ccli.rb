class Ccli < Formula
  desc 'A unified CLI for inspecting your Claude Code installation — MCP servers, skills, rules, projects, and metadata.'
  version '0.4.9'
  homepage 'https://github.com/jackchuka/ccli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.9/ccli_0.4.9_darwin_arm64.tar.gz'
      sha256 'e093276dc2f1d588eae1643ba52b985b70bd7ead99ae5e1e93caf5fd34c2c975'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.9/ccli_0.4.9_darwin_amd64.tar.gz'
      sha256 '55c7ce2b0d0147d73c6286916aa79df9452369faab6f8465dcabdad4d8fce454'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.9/ccli_0.4.9_linux_arm64.tar.gz'
      sha256 '0713e4516eb1fe356009a9499c70e843a3d8e30d496792cccd65de21a295b5e5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.9/ccli_0.4.9_linux_amd64.tar.gz'
      sha256 '4c1de21efe6a6de724173dc90050d3fd25a63294654119a477ddda95e007f2b9'
    end
  end

  head do
    url 'https://github.com/jackchuka/ccli.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'ccli'
  end
end
