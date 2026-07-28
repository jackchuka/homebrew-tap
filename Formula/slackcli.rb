class Slackcli < Formula
  desc 'The Slack CLI and MCP server built for LLM-powered agents and programmatic access.'
  version '0.3.19'
  homepage 'https://github.com/jackchuka/slackcli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.19/slackcli_0.3.19_darwin_arm64.tar.gz'
      sha256 '44bcc53b22b3a4167f0e0ac6f58632b6b794bd22d24fe3e78c15f03bd255b8cf'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.19/slackcli_0.3.19_darwin_amd64.tar.gz'
      sha256 '8a7d5b9ff3f2b61005725597add6b28e3ecdb8fd20308ca73e399b312b6248d8'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.19/slackcli_0.3.19_linux_arm64.tar.gz'
      sha256 'b70580622a045da8450e569e5292ced1bb7793260601452a79c63afd25c934d7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.19/slackcli_0.3.19_linux_amd64.tar.gz'
      sha256 'cb1701f044e41d7cf00a5649dc2afda7d1b3dd04591049d47cbdbce8d13aee4c'
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
