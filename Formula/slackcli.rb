class Slackcli < Formula
  desc 'The Slack CLI and MCP server built for LLM-powered agents and programmatic access.'
  version '0.3.7'
  homepage 'https://github.com/jackchuka/slackcli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.7/slackcli_0.3.7_darwin_arm64.tar.gz'
      sha256 '018ab53c4cf5b9ce49cf36ce0cb1db9c5a8649f4ab4d23fd1bbc9bcadd0fec29'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.7/slackcli_0.3.7_darwin_amd64.tar.gz'
      sha256 '683104ee7b7b3f08d7c6b3feec7573b7f477220bf1e54a058be0b8312a690701'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.7/slackcli_0.3.7_linux_arm64.tar.gz'
      sha256 '982a163e8a379019da3b1bf8c3f0ea2e50906edec51240565806c2f2a1590dee'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.7/slackcli_0.3.7_linux_amd64.tar.gz'
      sha256 '4ee24f4df036d1fed436d12650a7e7a882dd70637a338564d605d4682e118767'
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
