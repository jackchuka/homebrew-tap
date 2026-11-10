class Slackcli < Formula
  desc 'The Slack CLI and MCP server built for LLM-powered agents and programmatic access.'
  version '0.3.30'
  homepage 'https://github.com/jackchuka/slackcli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.30/slackcli_0.3.30_darwin_arm64.tar.gz'
      sha256 'd9e54924659b58b0f6a1b4079fca145cce6249c8b5db08f5cc99a4261f06474d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.30/slackcli_0.3.30_darwin_amd64.tar.gz'
      sha256 'f03e65e4909776d4aee70e2e038dcee5473871ef2203dcc1fed1dd8bc84be8ab'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.30/slackcli_0.3.30_linux_arm64.tar.gz'
      sha256 'b5fdb597c3a68a463279f9512afa98b62ad3c99f905a6ee74d5ef1f6139389f1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.30/slackcli_0.3.30_linux_amd64.tar.gz'
      sha256 'adfd3107e5ec2dd5e9ded26bc1a7a6fb2cdeae054afd28916293b9883f63c222'
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
