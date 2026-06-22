class Slackcli < Formula
  desc 'The Slack CLI and MCP server built for LLM-powered agents and programmatic access.'
  version '0.3.15'
  homepage 'https://github.com/jackchuka/slackcli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.15/slackcli_0.3.15_darwin_arm64.tar.gz'
      sha256 'beb13a82e45fc8724df80195312699c49daedb39bb1ed5cfdf579c9dc74566ee'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.15/slackcli_0.3.15_darwin_amd64.tar.gz'
      sha256 'b4d9e4b2d38c906ae68e50fa3a0a7e5cb5526dc08fce62ecbe55bc1bd02d9692'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.15/slackcli_0.3.15_linux_arm64.tar.gz'
      sha256 'bc2571abc95c7a077405fef210c47f121e3cb85f7756f9dabef8297f74133034'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.15/slackcli_0.3.15_linux_amd64.tar.gz'
      sha256 '2f09a1e4b63271871a7ba639d34828fb9da67da683349ae300e38e095cedb5a6'
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
