class Ccli < Formula
  desc 'A unified CLI for inspecting your Claude Code installation — MCP servers, skills, rules, projects, and metadata.'
  version '0.4.6'
  homepage 'https://github.com/jackchuka/ccli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.6/ccli_0.4.6_darwin_arm64.tar.gz'
      sha256 'f690b1c86f8ed885fe6caeada65052a34c626e651aa2ebb4df677ab70bb4d81c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.6/ccli_0.4.6_darwin_amd64.tar.gz'
      sha256 '1147391295ff7361c58bea23e0b192fe4839aa09a3029b81a6e2b9eecc761fc3'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.6/ccli_0.4.6_linux_arm64.tar.gz'
      sha256 'ca643bff9d39239d794569b515bad6419fd380c174b201e957de56914fa3f4a3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.6/ccli_0.4.6_linux_amd64.tar.gz'
      sha256 'a6abf5db789f3a9d2c957d58dd2d77936701f00d55417175eb31bf5e6f7c0a97'
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
