class Slackcli < Formula
  desc 'The Slack CLI and MCP server built for LLM-powered agents and programmatic access.'
  version '0.3.13'
  homepage 'https://github.com/jackchuka/slackcli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.13/slackcli_0.3.13_darwin_arm64.tar.gz'
      sha256 '0d892f1a51c5e347f6eaf6b16dd3238e4a1f25cd7079bb2da4eae1760ad8feba'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.13/slackcli_0.3.13_darwin_amd64.tar.gz'
      sha256 '3500e96b2f0e61c7a1052fcf10be90cffdafd0e1dd7647c3e569b3908d5b5e4d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.13/slackcli_0.3.13_linux_arm64.tar.gz'
      sha256 '12ee927ce63c997c3be07b99e901a98872cd842f2e61364e7b9eeb37bd155468'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.13/slackcli_0.3.13_linux_amd64.tar.gz'
      sha256 '93b40077e4aaa2230af037b59d17f1289d4d15d752d00ef17c5b87d563750ce1'
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
