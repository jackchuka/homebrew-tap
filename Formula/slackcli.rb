class Slackcli < Formula
  desc 'The Slack CLI and MCP server built for LLM-powered agents and programmatic access.'
  version '0.1.2'
  homepage 'https://github.com/jackchuka/slackcli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.1.2/slackcli_0.1.2_darwin_arm64.tar.gz'
      sha256 '1a87926640bf9fbae842f93fa0e65a3bfea4b045a5d4612aa5b5ccc78bfb84f4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.1.2/slackcli_0.1.2_darwin_amd64.tar.gz'
      sha256 'd0c27e47b885e28b9289d51e82c5fd6662e281655253e1286f31e5db76ed908d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.1.2/slackcli_0.1.2_linux_arm64.tar.gz'
      sha256 '24a1a1da2f111fed35842fce8ffecd3cc2c46cfcf8775964a9a5676787923410'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.1.2/slackcli_0.1.2_linux_amd64.tar.gz'
      sha256 'fa5ab37f64b80b8c71a6cea00036a5a5c35b9787baf82e5c16b5234e5d3e0161'
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
