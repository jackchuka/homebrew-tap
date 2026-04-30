class Slackcli < Formula
  desc 'The Slack CLI and MCP server built for LLM-powered agents and programmatic access.'
  version '0.3.8'
  homepage 'https://github.com/jackchuka/slackcli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.8/slackcli_0.3.8_darwin_arm64.tar.gz'
      sha256 '3c392013d98169e2c4454e1087c8576de5a9984fe723a7f00007937173ead681'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.8/slackcli_0.3.8_darwin_amd64.tar.gz'
      sha256 '00c1af01bdf300910f7056242013053507dc434272ed770ef056d39e70d4cdde'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.8/slackcli_0.3.8_linux_arm64.tar.gz'
      sha256 '1368e91e26d4b2fc768b474183fccf271eea45bcfe36f86ec73635e835aad919'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.8/slackcli_0.3.8_linux_amd64.tar.gz'
      sha256 '47acbb729813c09898ae0a0f8598c4c62cd8dd99eab31360c4248142a9323ee8'
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
