class Slackcli < Formula
  desc 'The Slack CLI and MCP server built for LLM-powered agents and programmatic access.'
  version '0.3.0'
  homepage 'https://github.com/jackchuka/slackcli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.0/slackcli_0.3.0_darwin_arm64.tar.gz'
      sha256 '851a385614071327bdba707dd0f46752ecd494c4e06e2af9d04d9cd72229ee09'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.0/slackcli_0.3.0_darwin_amd64.tar.gz'
      sha256 'a74b5a32c0e4df037f340aaa86b6a9b0b6dbed952f87060cdfc72ec92df424fe'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.0/slackcli_0.3.0_linux_arm64.tar.gz'
      sha256 '6124c95168fc3a615c7667f12d06c4257980c276085b2070bfdb9aa691ff1122'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.0/slackcli_0.3.0_linux_amd64.tar.gz'
      sha256 '7566f191cffa32a5d19f24f05c83ce32ae2e3846b7064c2ef779416bfa90084a'
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
