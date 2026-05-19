class Slackcli < Formula
  desc 'The Slack CLI and MCP server built for LLM-powered agents and programmatic access.'
  version '0.3.11'
  homepage 'https://github.com/jackchuka/slackcli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.11/slackcli_0.3.11_darwin_arm64.tar.gz'
      sha256 '0c8a89dccb5050902ab694eed71b35ad12394fbb0b63af3d56d5889bb848ea40'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.11/slackcli_0.3.11_darwin_amd64.tar.gz'
      sha256 '231edb620a6c483a76ce2a6ea1dda2555a00d548201d51adff1d9b2e77156c7c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.11/slackcli_0.3.11_linux_arm64.tar.gz'
      sha256 '693e04a9593fc9b10c893577799656abd524ce7211d0d80b1d827f916acdbf42'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.11/slackcli_0.3.11_linux_amd64.tar.gz'
      sha256 'b1667683ce52dfea2b0ac82b5d036333c94911c167523600ada0580b9a559f4b'
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
