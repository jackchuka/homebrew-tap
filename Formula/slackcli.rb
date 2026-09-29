class Slackcli < Formula
  desc 'The Slack CLI and MCP server built for LLM-powered agents and programmatic access.'
  version '0.3.25'
  homepage 'https://github.com/jackchuka/slackcli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.25/slackcli_0.3.25_darwin_arm64.tar.gz'
      sha256 '366d5e490e0497ab815c58a89d181318e7cb3e335ef74464b06025f78a8a2d7d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.25/slackcli_0.3.25_darwin_amd64.tar.gz'
      sha256 'ac6bbe09ab1e58277c6086d7ebfc01967f233912df008ae3ce0774f8674d9e09'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.25/slackcli_0.3.25_linux_arm64.tar.gz'
      sha256 '4e780503366d26d3f9ef4bd40ebbccb2670d698f0887aedbc9b6d2544c359063'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.25/slackcli_0.3.25_linux_amd64.tar.gz'
      sha256 'aa4044fcc4b77f4435010ba85881c26f3b70911171faf208aaa1595a47ffec92'
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
