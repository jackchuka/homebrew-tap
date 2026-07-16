class Slackcli < Formula
  desc 'The Slack CLI and MCP server built for LLM-powered agents and programmatic access.'
  version '0.3.17'
  homepage 'https://github.com/jackchuka/slackcli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.17/slackcli_0.3.17_darwin_arm64.tar.gz'
      sha256 'e64c64b95ba91e388e0ca3f6d5e8245c430e1712efc206c21ac99740d24ea1ad'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.17/slackcli_0.3.17_darwin_amd64.tar.gz'
      sha256 'cbd616e5383c554fecc84af5275a4b849b82ce1af4d5f331079f528cfaa7589f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.17/slackcli_0.3.17_linux_arm64.tar.gz'
      sha256 '3e2ee82e218f97aa041d800992338f087ebd471ff8fa54639f5002caa6ed81d4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.17/slackcli_0.3.17_linux_amd64.tar.gz'
      sha256 '6af9a3af245905aa931f85ab7e5d19d4713ca60055e7fec54b411a4e3697e1a6'
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
