class Slackcli < Formula
  desc 'The Slack CLI and MCP server built for LLM-powered agents and programmatic access.'
  version '0.3.21'
  homepage 'https://github.com/jackchuka/slackcli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.21/slackcli_0.3.21_darwin_arm64.tar.gz'
      sha256 'c4ee9bb9c774b70b241d3f44da7ac3ed289e8dcf56b95e987898ae72cecf9aa2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.21/slackcli_0.3.21_darwin_amd64.tar.gz'
      sha256 '14470758c9214b453770067bbf2f8e4dcca1d2e24d5e0b8965b2c0b93b1e9374'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.21/slackcli_0.3.21_linux_arm64.tar.gz'
      sha256 '51eabe8bdb3a618f9bae996f81f4788c0ae25d7e963d5520884164edb70d62f6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.21/slackcli_0.3.21_linux_amd64.tar.gz'
      sha256 'e4a7fcdd2b46c0f41419f3ff00958b0146d1259cb1487a714b0eb278fc0aea78'
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
