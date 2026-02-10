class Slackcli < Formula
  desc 'The Slack CLI and MCP server built for LLM-powered agents and programmatic access.'
  version '0.1.0'
  homepage 'https://github.com/jackchuka/slackcli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.1.0/slackcli_0.1.0_darwin_arm64.tar.gz'
      sha256 '137df7214c70817f8d7189cb89c91e5832e19969f2c5ddb3cf2b4dcfae3b78ce'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.1.0/slackcli_0.1.0_darwin_amd64.tar.gz'
      sha256 'b04cda057b1855a28865b0846d325b1a4f72a2e1514f599f55949117ccd6d759'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.1.0/slackcli_0.1.0_linux_arm64.tar.gz'
      sha256 'c32c68089541be5f14831feaad6757f90b911836a6877c58cea511e30a5f6636'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.1.0/slackcli_0.1.0_linux_amd64.tar.gz'
      sha256 '39fc1c6ec1f4398f0bed6e20088f22ac304b32cc9730fa50ca55c1da15f9a207'
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
