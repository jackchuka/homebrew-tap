class Ccli < Formula
  desc 'A unified CLI for inspecting your Claude Code installation — MCP servers, skills, rules, projects, and metadata.'
  version '0.4.5'
  homepage 'https://github.com/jackchuka/ccli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.5/ccli_0.4.5_darwin_arm64.tar.gz'
      sha256 '0bbc5815070c38e7b6d9aabdad50d4e5704105e2dab99d0a79587591c71fdba4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.5/ccli_0.4.5_darwin_amd64.tar.gz'
      sha256 'a99bfebd8c72c0025aa1f63ad8bab0834300c71728d95fdb89482120a3ee0340'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.5/ccli_0.4.5_linux_arm64.tar.gz'
      sha256 '0bf45aeb871b9839c6cf2434d3851bb459b755622a8a0adc8a57e3b0766ec9dd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.5/ccli_0.4.5_linux_amd64.tar.gz'
      sha256 'af6e14c4d424281dcac540051d7a809de00550713cb98a161671b584be409acf'
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
