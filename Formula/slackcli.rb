class Slackcli < Formula
  desc 'The Slack CLI and MCP server built for LLM-powered agents and programmatic access.'
  version '0.3.6'
  homepage 'https://github.com/jackchuka/slackcli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.6/slackcli_0.3.6_darwin_arm64.tar.gz'
      sha256 'a2d5d98f51e528256a2be771cedcb33f12aed3e4fc7766aaafdc1feadf1b7d49'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.6/slackcli_0.3.6_darwin_amd64.tar.gz'
      sha256 'f1598686b5c53c1effdc30c9f148379e94194eae9fff217a68f7ea9e42ab81de'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.6/slackcli_0.3.6_linux_arm64.tar.gz'
      sha256 'd34fb7843a9095f72a70b8d1e79cc5a82ffec3049cb349ea5315bc7bd0d4496f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.6/slackcli_0.3.6_linux_amd64.tar.gz'
      sha256 'f1c50cafd83ee7d896b6ea5f38ed4cccc33afdc3ed8564aaedee58c7d04804d7'
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
