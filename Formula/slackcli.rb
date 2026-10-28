class Slackcli < Formula
  desc 'The Slack CLI and MCP server built for LLM-powered agents and programmatic access.'
  version '0.3.28'
  homepage 'https://github.com/jackchuka/slackcli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.28/slackcli_0.3.28_darwin_arm64.tar.gz'
      sha256 '3a7adbb4bbe8959c0d5118418aa4dba1ecbef40fca5ad7c4a9f74b947a70baa0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.28/slackcli_0.3.28_darwin_amd64.tar.gz'
      sha256 '86ac7c46e3a50a709296b6362f5ac259672ae847e008d648e0920d709b8cfc75'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.28/slackcli_0.3.28_linux_arm64.tar.gz'
      sha256 '713a597b16d7e116ba3d8a7c9acf1789b0cc66206752a7b85a1f372404222eec'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.28/slackcli_0.3.28_linux_amd64.tar.gz'
      sha256 '5ff6cf329e8e94ecb4c2cb558a4a031b738a64351c1a56f7ee92cf28dad3f428'
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
