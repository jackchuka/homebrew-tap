class Slackcli < Formula
  desc 'The Slack CLI and MCP server built for LLM-powered agents and programmatic access.'
  version '0.3.29'
  homepage 'https://github.com/jackchuka/slackcli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.29/slackcli_0.3.29_darwin_arm64.tar.gz'
      sha256 'bb7dd42d17690454855d6064fdde47607aae3f8064f3c4e38f18e0706a3b0576'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.29/slackcli_0.3.29_darwin_amd64.tar.gz'
      sha256 '0652b3e570d0ede16f73b644692540c96193b25f3ac44c48d4214e9880819d99'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.29/slackcli_0.3.29_linux_arm64.tar.gz'
      sha256 '331dbe0f064525a474b1310383d04c24dc3a4625b118b839e45874e24b02608a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.29/slackcli_0.3.29_linux_amd64.tar.gz'
      sha256 '555e222e73524dfcdbf1488ebf54faf09b0f9d31554d3e8cae5b4c0a5b9f10e4'
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
