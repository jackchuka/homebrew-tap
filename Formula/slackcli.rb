class Slackcli < Formula
  desc 'The Slack CLI and MCP server built for LLM-powered agents and programmatic access.'
  version '0.3.12'
  homepage 'https://github.com/jackchuka/slackcli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.12/slackcli_0.3.12_darwin_arm64.tar.gz'
      sha256 '4cc5c3330ef67ec4a12c80a23bd31a865d4f5c436e1ce0dc3a48163cfea872bb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.12/slackcli_0.3.12_darwin_amd64.tar.gz'
      sha256 '7bfe615e820a8b0ab2af432bbfbfecfc7aac9d02bbae8eb3daf7c8ba34b69108'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.12/slackcli_0.3.12_linux_arm64.tar.gz'
      sha256 '2cb00fbb40cf75ff49bbe92599a7cc2f24454201fdb2207773ca17285d84e6d6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.12/slackcli_0.3.12_linux_amd64.tar.gz'
      sha256 '98a18f0fd2ad1f1cfd34fe9de892b28bca55799199f516f5472bb2c563d282de'
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
