class Slackcli < Formula
  desc 'The Slack CLI and MCP server built for LLM-powered agents and programmatic access.'
  version '0.2.0'
  homepage 'https://github.com/jackchuka/slackcli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.2.0/slackcli_0.2.0_darwin_arm64.tar.gz'
      sha256 '56a060dd9f73ad4abc9a287a9a6f4ca3f0aa9fe8c976fc62b5036e784726c71a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.2.0/slackcli_0.2.0_darwin_amd64.tar.gz'
      sha256 '2f4727019e2b6e17cfc9eb4e3732872f6a5bdfeecd51ea67e09a6adb445b0251'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.2.0/slackcli_0.2.0_linux_arm64.tar.gz'
      sha256 'a0616e1915760880830967cc114c2362c9b71697755d37ece671467fcfed2d1f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.2.0/slackcli_0.2.0_linux_amd64.tar.gz'
      sha256 '9a4146037d7d370471b5a9e7ed2bdb7dca0d11ebcd198c00f1f648554de5b6bb'
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
