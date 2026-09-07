class Slackcli < Formula
  desc 'The Slack CLI and MCP server built for LLM-powered agents and programmatic access.'
  version '0.3.22'
  homepage 'https://github.com/jackchuka/slackcli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.22/slackcli_0.3.22_darwin_arm64.tar.gz'
      sha256 '737de7cd55665851a65ad56394f441d320e057151d6fce4b95a70c63dc5d5d3e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.22/slackcli_0.3.22_darwin_amd64.tar.gz'
      sha256 'f012e9d258e14f4b13281f831a30d0c035dab3334bcc1afe8767add2658f44f7'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.22/slackcli_0.3.22_linux_arm64.tar.gz'
      sha256 'd00636f875b83e01f547e0e3f3d4ab8c61e1690998e3c965449cf4669d51356b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.22/slackcli_0.3.22_linux_amd64.tar.gz'
      sha256 '7e3755670292a8ebd3af53e2444704664bab4bf35da5ea36d4988e6b30732b95'
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
