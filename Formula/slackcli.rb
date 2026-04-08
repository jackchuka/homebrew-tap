class Slackcli < Formula
  desc 'The Slack CLI and MCP server built for LLM-powered agents and programmatic access.'
  version '0.3.5'
  homepage 'https://github.com/jackchuka/slackcli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.5/slackcli_0.3.5_darwin_arm64.tar.gz'
      sha256 'b434486b453c0edf46206e00c6e7b9d421129595ed82d8807664a5aa7159e916'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.5/slackcli_0.3.5_darwin_amd64.tar.gz'
      sha256 '55d863abee1d3f4e23ea215900cc5d823cb4b5fce78262a2451b8a21ad280a18'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.5/slackcli_0.3.5_linux_arm64.tar.gz'
      sha256 '563bef8b85b4f065cd7fa795eeaaa171d56a269451a2bb278b30f8384bdc424d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.5/slackcli_0.3.5_linux_amd64.tar.gz'
      sha256 'b38a4af708e32f98cf1310be08f666b50231364fed141d77fc9e7177ec5aef55'
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
