class Ccli < Formula
  desc 'A unified CLI for inspecting your Claude Code installation — MCP servers, skills, rules, projects, and metadata.'
  version '0.3.1'
  homepage 'https://github.com/jackchuka/ccli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.3.1/ccli_0.3.1_darwin_arm64.tar.gz'
      sha256 '0f7548781c017bf0da77497ad085d5c50c0a1d49e2f2c51f8d7b08b36e04ae78'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.3.1/ccli_0.3.1_darwin_amd64.tar.gz'
      sha256 '549a973dc09bbaa9e2275bb469d9058cdd2253997c47a55c98df960f0f3ef8ff'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.3.1/ccli_0.3.1_linux_arm64.tar.gz'
      sha256 '068d5a42c0b14be712a752b20583c330122cdee22d9a3c9e57b3c33060398309'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.3.1/ccli_0.3.1_linux_amd64.tar.gz'
      sha256 '28769aa315df15f05884f076b1391d55f7179ad6e4f7cec562417e13e56221d0'
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
