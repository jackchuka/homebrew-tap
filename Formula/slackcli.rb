class Slackcli < Formula
  desc 'The Slack CLI and MCP server built for LLM-powered agents and programmatic access.'
  version '0.3.1'
  homepage 'https://github.com/jackchuka/slackcli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.1/slackcli_0.3.1_darwin_arm64.tar.gz'
      sha256 'ca4e8e8992f399cc7314dc3a6feddd4d9995b783a37aeda2589344ae2bfb6892'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.1/slackcli_0.3.1_darwin_amd64.tar.gz'
      sha256 'ecf4142f0f9e46e8ee908c47c1a04eab5bc478f1029490980d206bd2bad92283'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.1/slackcli_0.3.1_linux_arm64.tar.gz'
      sha256 '0aaeca94a75ad610fd0cfc607d7628be79dd849242832584d5de6b27dfe94377'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.1/slackcli_0.3.1_linux_amd64.tar.gz'
      sha256 '97c055dd6e21d6dfc6f6a40444c3657d711bcc30e563921a5e21206c6467e668'
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
