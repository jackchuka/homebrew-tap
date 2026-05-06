class Slackcli < Formula
  desc 'The Slack CLI and MCP server built for LLM-powered agents and programmatic access.'
  version '0.3.9'
  homepage 'https://github.com/jackchuka/slackcli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.9/slackcli_0.3.9_darwin_arm64.tar.gz'
      sha256 'cae8bc93aa91b7094b35f4bfee2dfaab62f7ccd1cb79533ed0edeea611eade60'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.9/slackcli_0.3.9_darwin_amd64.tar.gz'
      sha256 '603cdbb8ca876b8b2e25bb983b4c6f0883d156711b381d67b3ceb7da217a7315'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.9/slackcli_0.3.9_linux_arm64.tar.gz'
      sha256 '3d297328f4de5b0e7968832b9c6ab00410b94f110fae43bc6df90f76f8bb3865'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.9/slackcli_0.3.9_linux_amd64.tar.gz'
      sha256 'e9bb7b76d416262ae1d4aa0b3ec99ee0470e73e08745caabb07f2a5e81f725ad'
    end
  end

  head do
    url 'https://github.com/jackchuka/slackcli.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'slackcli'
  end
end
