class Slackcli < Formula
  desc 'The Slack CLI and MCP server built for LLM-powered agents and programmatic access.'
  version '0.3.31'
  homepage 'https://github.com/jackchuka/slackcli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.31/slackcli_0.3.31_darwin_arm64.tar.gz'
      sha256 '84aa7177736810f48782378f5010c9b6f28daa955716975c028c7b1b36d42ae7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.31/slackcli_0.3.31_darwin_amd64.tar.gz'
      sha256 'ccf0f2712701bd3d619e988ec6c860841e1d5fae81ac7e7486bc200c4ccb6eae'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.31/slackcli_0.3.31_linux_arm64.tar.gz'
      sha256 '78145264969a11397d04ade0e4beda89b3bafe662cf8ba52356c01410cdffe72'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.31/slackcli_0.3.31_linux_amd64.tar.gz'
      sha256 '8df8f20f1a5571950d0e25e336a6caed1491e09566b1f601ce75e063b555f862'
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
