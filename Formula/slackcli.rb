class Slackcli < Formula
  desc 'The Slack CLI and MCP server built for LLM-powered agents and programmatic access.'
  version '0.3.20'
  homepage 'https://github.com/jackchuka/slackcli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.20/slackcli_0.3.20_darwin_arm64.tar.gz'
      sha256 '8d8c97d0bb1ac97d01b999b55bf88cccddaef2674c95b9c41d9f2f5daf6faacc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.20/slackcli_0.3.20_darwin_amd64.tar.gz'
      sha256 'a626bae426a4d747e51a6a938186fca402d1d7943c97fdadf08166b39dbadf8a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.20/slackcli_0.3.20_linux_arm64.tar.gz'
      sha256 '695edef62e2b609c046ef381273c2e520431f15a19fadefa088b3f22ad3f9297'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.20/slackcli_0.3.20_linux_amd64.tar.gz'
      sha256 '0b46fcb21dfea0b727779d20390b21e16a8387c2092d50b5d797d61f5c6ee1d1'
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
