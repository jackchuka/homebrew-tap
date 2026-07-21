class Slackcli < Formula
  desc 'The Slack CLI and MCP server built for LLM-powered agents and programmatic access.'
  version '0.3.18'
  homepage 'https://github.com/jackchuka/slackcli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.18/slackcli_0.3.18_darwin_arm64.tar.gz'
      sha256 '925b935bf1401b59def9c11e7f1c408336a454b2b2a0b5dea073d0119f6fe159'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.18/slackcli_0.3.18_darwin_amd64.tar.gz'
      sha256 '5246a24f9273ad1620942b104aa4e785e10acb7ead52a8e60abc0e42e6272b51'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.18/slackcli_0.3.18_linux_arm64.tar.gz'
      sha256 'dd185f328b3be78890d7628209c96cec252f22a85962768753959cd5d133704d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.18/slackcli_0.3.18_linux_amd64.tar.gz'
      sha256 'fb260e2e98aab17f3a7efae12d47b4eb5fa5aeda97c6a8a397d4fd20626d2dd3'
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
