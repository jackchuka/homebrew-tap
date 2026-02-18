class Slackcli < Formula
  desc 'The Slack CLI and MCP server built for LLM-powered agents and programmatic access.'
  version '0.1.1'
  homepage 'https://github.com/jackchuka/slackcli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.1.1/slackcli_0.1.1_darwin_arm64.tar.gz'
      sha256 '6bd4485394aff3537e2733d3eb211025e0fc59f92e545ee6a25e3a1cfbb2aee1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.1.1/slackcli_0.1.1_darwin_amd64.tar.gz'
      sha256 '6547cc826e48d25a0d5c2e042ac251bc96ec29e19118fd27edd955a62be75340'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.1.1/slackcli_0.1.1_linux_arm64.tar.gz'
      sha256 'e26aa0c0d57f2e53c1101f52ab2fae921410249d644641e8f499467c6bebb4bc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.1.1/slackcli_0.1.1_linux_amd64.tar.gz'
      sha256 '01e373e34271fb577aa2f8cc3ee56bb3678a235a1f7a9a8648836211704a84b9'
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
