class Slackcli < Formula
  desc 'The Slack CLI and MCP server built for LLM-powered agents and programmatic access.'
  version '0.3.3'
  homepage 'https://github.com/jackchuka/slackcli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.3/slackcli_0.3.3_darwin_arm64.tar.gz'
      sha256 '57b898eed1f746720c0d71349b40a4a1daba15b3bdf08c259078ccc2e0fe8863'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.3/slackcli_0.3.3_darwin_amd64.tar.gz'
      sha256 '7ebd37cb9fa9cf0f61d6665b441f322297844532b309bc8b09a5ec96f570b2eb'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.3/slackcli_0.3.3_linux_arm64.tar.gz'
      sha256 'd09f73fa1e730494ee4cfd37ab67f6cfb560aa5a69a0f9d178f629cbf25dccfd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.3/slackcli_0.3.3_linux_amd64.tar.gz'
      sha256 '588dcbdfa0800e69cf96e90143c0bae7d210f3e51c0606cca6b367e7ff780544'
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
