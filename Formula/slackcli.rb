class Slackcli < Formula
  desc 'The Slack CLI and MCP server built for LLM-powered agents and programmatic access.'
  version '0.3.27'
  homepage 'https://github.com/jackchuka/slackcli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.27/slackcli_0.3.27_darwin_arm64.tar.gz'
      sha256 '27d47f483e0457116aa475630035ed94edce7deb3367751252df12ee9198b49d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.27/slackcli_0.3.27_darwin_amd64.tar.gz'
      sha256 '26c7e94b471587eec818053effb44a0f8336450e7989a8d0d8135494a82afca2'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.27/slackcli_0.3.27_linux_arm64.tar.gz'
      sha256 '51d4b892c23a29d175fee1c17be0c50d54b07d3eb2f00b34cc372bf7f71845fc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.27/slackcli_0.3.27_linux_amd64.tar.gz'
      sha256 '16ac1368005c64e7a3172c46a2242a9dc3922411fef63c80bc0aa0bf3d099dbd'
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
