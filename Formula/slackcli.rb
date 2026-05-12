class Slackcli < Formula
  desc 'The Slack CLI and MCP server built for LLM-powered agents and programmatic access.'
  version '0.3.10'
  homepage 'https://github.com/jackchuka/slackcli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.10/slackcli_0.3.10_darwin_arm64.tar.gz'
      sha256 '730072ba063dee29719ea4e9993dc18be1f283dc90d84b67878ceeba08666708'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.10/slackcli_0.3.10_darwin_amd64.tar.gz'
      sha256 '5157cd0062e47b2a3c6a97e26bb0d07b488e80f25d10bc83ff316b5b45698521'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.10/slackcli_0.3.10_linux_arm64.tar.gz'
      sha256 '2cad413b1ea3b665a7990bc6d047b744e3f246ad7d4d84113e265d9c86f692d8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.10/slackcli_0.3.10_linux_amd64.tar.gz'
      sha256 'af35d4af351bc7106f0574545c5487c382646926be28cb07216396b6ed039213'
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
