class Ccli < Formula
  desc 'A unified CLI for inspecting your Claude Code installation — MCP servers, skills, rules, projects, and metadata.'
  version '0.4.12'
  homepage 'https://github.com/jackchuka/ccli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.12/ccli_0.4.12_darwin_arm64.tar.gz'
      sha256 '491fba250af164888550042c65c96d6730c94937afc550e1ee558e57d6ea64a1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.12/ccli_0.4.12_darwin_amd64.tar.gz'
      sha256 '85820e42fde26db3ea3899758b2b710f4b32c272a68d52dfa032eba2a048305c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.12/ccli_0.4.12_linux_arm64.tar.gz'
      sha256 'b1dbf1684aaed30512ad14015fe438c9b18cd14144c46e9253ab44246f07a992'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.12/ccli_0.4.12_linux_amd64.tar.gz'
      sha256 'aa7b4d8e675c1f7cf0e077aa30a8242cd4fe2036beeeea403cf84e17e1d664e2'
    end
  end

  head do
    url 'https://github.com/jackchuka/ccli.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'ccli'
  end
end
