class Slackcli < Formula
  desc 'The Slack CLI and MCP server built for LLM-powered agents and programmatic access.'
  version '0.3.14'
  homepage 'https://github.com/jackchuka/slackcli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.14/slackcli_0.3.14_darwin_arm64.tar.gz'
      sha256 '6f1080ad3c518fc3575d84ec78873b2b5d6f20df8bf0cc03341404a9d4be972f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.14/slackcli_0.3.14_darwin_amd64.tar.gz'
      sha256 '88e23dc6be3d24b101fa33147a8e529e24ed322a0ec7a41e4291284a956d9e73'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.14/slackcli_0.3.14_linux_arm64.tar.gz'
      sha256 '1a5a423e43ea557536627dc493021f1eb37e3d6ca4586261fca0f1aae1977916'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.14/slackcli_0.3.14_linux_amd64.tar.gz'
      sha256 'b9a6158cffb599b9ac1a9900dcd11b7972e574d9400bdd8eee4f3b5952f74c53'
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
