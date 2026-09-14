class Slackcli < Formula
  desc 'The Slack CLI and MCP server built for LLM-powered agents and programmatic access.'
  version '0.3.23'
  homepage 'https://github.com/jackchuka/slackcli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.23/slackcli_0.3.23_darwin_arm64.tar.gz'
      sha256 '39a12379786d97370fb9144e9d2c792197e039d564096bc15b7cd852597f677a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.23/slackcli_0.3.23_darwin_amd64.tar.gz'
      sha256 'b33bfb289cf300fbebd006e1439291564f47af809b1eb93cdbe16fbc56d0d9ef'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.23/slackcli_0.3.23_linux_arm64.tar.gz'
      sha256 'bb969874d7094aae1523d32cb6b6099c7853965decbb2ae8c36cb3c1c180e861'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.23/slackcli_0.3.23_linux_amd64.tar.gz'
      sha256 '61226e9f4afd0c3f526af7c1850afac0db0eaf0911fec39072400aad04d7eca6'
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
