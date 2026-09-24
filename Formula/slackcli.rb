class Slackcli < Formula
  desc 'The Slack CLI and MCP server built for LLM-powered agents and programmatic access.'
  version '0.3.24'
  homepage 'https://github.com/jackchuka/slackcli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.24/slackcli_0.3.24_darwin_arm64.tar.gz'
      sha256 '9c152a2b3365766aa7f72309fffbdc4811e51b78411939d01791650d143abc73'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.24/slackcli_0.3.24_darwin_amd64.tar.gz'
      sha256 '46d18e466933983bae54feeabdaf98283c031410c015ebcec9c6f191da44bfde'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.24/slackcli_0.3.24_linux_arm64.tar.gz'
      sha256 '51d420f2b59193e0d293082a9e5fae616f2f97098af3d2073c9306267182ebb3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.24/slackcli_0.3.24_linux_amd64.tar.gz'
      sha256 'cc8ce9d657dd81d0f195058bcdaae1cca20b80a4af093292bc5d162fcce8e1e4'
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
