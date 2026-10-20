class Ccli < Formula
  desc 'A unified CLI for inspecting your Claude Code installation — MCP servers, skills, rules, projects, and metadata.'
  version '0.5.1'
  homepage 'https://github.com/jackchuka/ccli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.5.1/ccli_0.5.1_darwin_arm64.tar.gz'
      sha256 '5c195a92a0b0477a57db29f1f5e21f2160c8fd1f9103cd6957c378545ba1b404'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.5.1/ccli_0.5.1_darwin_amd64.tar.gz'
      sha256 '71c92d705952099e1758f56b52078536752f75b222db4cf884ce3ed1045b13f9'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.5.1/ccli_0.5.1_linux_arm64.tar.gz'
      sha256 '89913160c11dd49af5030ebd501bc26925f06357854bd7b986f40c7c81c03dba'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.5.1/ccli_0.5.1_linux_amd64.tar.gz'
      sha256 'fb80ced8b3ef8ee216c6d997c692711b90031a8cb445858aca8f69cb0731376c'
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
