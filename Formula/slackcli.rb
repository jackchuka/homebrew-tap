class Slackcli < Formula
  desc 'The Slack CLI and MCP server built for LLM-powered agents and programmatic access.'
  version '0.3.26'
  homepage 'https://github.com/jackchuka/slackcli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.26/slackcli_0.3.26_darwin_arm64.tar.gz'
      sha256 'ac00505ec514d16d9051bedc1dc98ef149b873b6a84ea342b41e6fa2895868fa'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.26/slackcli_0.3.26_darwin_amd64.tar.gz'
      sha256 'f12d4c915216ef1215cf79a41268a364c330da7bf664f1482af6824b3d2e9e6d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.26/slackcli_0.3.26_linux_arm64.tar.gz'
      sha256 '24198edc2b386a3fee241e29b7c083cdd816edae807d135b03080b641dfe9aad'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.26/slackcli_0.3.26_linux_amd64.tar.gz'
      sha256 'a834de618937cbbc133d06a89e226bd7baf4c20f7af68b8dc4826ea4b2d87730'
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
