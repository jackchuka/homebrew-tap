class Ccli < Formula
  desc 'A unified CLI for inspecting your Claude Code installation — MCP servers, skills, rules, projects, and metadata.'
  version '0.1.0'
  homepage 'https://github.com/jackchuka/ccli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.1.0/ccli_0.1.0_darwin_arm64.tar.gz'
      sha256 '365854bc2aed16d31f784b4dfb92a48d97a7444b9f4fe5c1bb679107a4e1b066'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.1.0/ccli_0.1.0_darwin_amd64.tar.gz'
      sha256 '4ca9c903f5d4d0bb1b11e7777dd67641c03d3fe35cbd9df02167765b3a35f97c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.1.0/ccli_0.1.0_linux_arm64.tar.gz'
      sha256 '2abe56f3d2fcb7e44b773f60111ab2304d7283f2495ab0c95c4f1137534df8a8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.1.0/ccli_0.1.0_linux_amd64.tar.gz'
      sha256 '239b54497a6ca22dd75d1690ad0f753133a1e8d3438bf4c133a8698f21174959'
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
