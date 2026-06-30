class Slackcli < Formula
  desc 'The Slack CLI and MCP server built for LLM-powered agents and programmatic access.'
  version '0.3.16'
  homepage 'https://github.com/jackchuka/slackcli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.16/slackcli_0.3.16_darwin_arm64.tar.gz'
      sha256 'c9eb1a75c496e0209feff1b208ac3b81ced37d7dd20bf19044e35cb4ceaae119'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.16/slackcli_0.3.16_darwin_amd64.tar.gz'
      sha256 '773c86a498ad0bb0aa7d1adc11b3ddfed0d9962896fb0c76aa388a1da8fb3342'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.16/slackcli_0.3.16_linux_arm64.tar.gz'
      sha256 '6c5b71a38abc683fee73536d29d426ce02b84472e828cc8ab5e092a526969dc9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.16/slackcli_0.3.16_linux_amd64.tar.gz'
      sha256 'f0d7ae4d094654e98d3a9d688f495df32d89e0c5d55635c51d9ab1dfd4079abc'
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
