class Ccli < Formula
  desc 'A unified CLI for inspecting your Claude Code installation — MCP servers, skills, rules, projects, and metadata.'
  version '0.4.2'
  homepage 'https://github.com/jackchuka/ccli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.2/ccli_0.4.2_darwin_arm64.tar.gz'
      sha256 '976409fb7f371e68004af7a32b2f746be0e36cf626c2aae44e194b206ee5041e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.2/ccli_0.4.2_darwin_amd64.tar.gz'
      sha256 '7a3109ad479c588f6c2de95525727c1c1d1074af6d2db3bd11e339f70c9e270c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.2/ccli_0.4.2_linux_arm64.tar.gz'
      sha256 '1f9acb5f37c26a05c030d612645c17eb6ec03da5d7782c693b5af3cd185081ae'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.2/ccli_0.4.2_linux_amd64.tar.gz'
      sha256 'e82c0aff32b59cf1a9f1b03ee614cc0a6df65fc7a16e33911729c419f8e1e47a'
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
