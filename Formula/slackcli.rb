class Slackcli < Formula
  desc 'The Slack CLI and MCP server built for LLM-powered agents and programmatic access.'
  version '0.3.2'
  homepage 'https://github.com/jackchuka/slackcli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.2/slackcli_0.3.2_darwin_arm64.tar.gz'
      sha256 '5d608a36e598ced463f8b1293f8b10690bf3a843a6875606072c90bdd40838b2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.2/slackcli_0.3.2_darwin_amd64.tar.gz'
      sha256 '450ab8b5b75efda4528987f7efd86a07506da1237d33af9824e4d3bb58edbfa8'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.2/slackcli_0.3.2_linux_arm64.tar.gz'
      sha256 '8e108de30cc16a1c80dac9c111a872c898d1947d5712418a19484e354b4e5d2a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.2/slackcli_0.3.2_linux_amd64.tar.gz'
      sha256 'de3c20e9bebd0aaa6918c35c5cadb991f5c293a794206d6a754e53f4700e8b23'
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
