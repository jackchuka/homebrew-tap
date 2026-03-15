class Ccli < Formula
  desc 'A unified CLI for inspecting your Claude Code installation — MCP servers, skills, rules, projects, and metadata.'
  version '0.4.1'
  homepage 'https://github.com/jackchuka/ccli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.1/ccli_0.4.1_darwin_arm64.tar.gz'
      sha256 '8ef98737cbd26e0ada84a094f08310936774cec12997c25b22262e246701ce52'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.1/ccli_0.4.1_darwin_amd64.tar.gz'
      sha256 '5ef3f54620b263ddc46693dc79791d21bcf9eb4814cc6ea67ab2fae7d5f54119'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.1/ccli_0.4.1_linux_arm64.tar.gz'
      sha256 'c66b19a91df0d558eb44c5b0fc51fca929f15791e5e49df65d990e29e2bc0e97'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.1/ccli_0.4.1_linux_amd64.tar.gz'
      sha256 '3a42ec888db1373c94a2d5d9fab886d31142286e10ef31c02fb3fa537a8ccf15'
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
