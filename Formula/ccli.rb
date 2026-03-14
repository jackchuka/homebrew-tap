class Ccli < Formula
  desc 'A unified CLI for inspecting your Claude Code installation — MCP servers, skills, rules, projects, and metadata.'
  version '0.4.0'
  homepage 'https://github.com/jackchuka/ccli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.0/ccli_0.4.0_darwin_arm64.tar.gz'
      sha256 '96e6c92e92732531d8998db7c4473c0cabfe85bb7a41632d377ddd19b5a811f7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.0/ccli_0.4.0_darwin_amd64.tar.gz'
      sha256 '5411c5ad8825dda04756a314d5fe9b60afdc4197b5c3b2ea35bb71a3007d4e8f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.0/ccli_0.4.0_linux_arm64.tar.gz'
      sha256 '0c3a96ead06d52fc5a2163b084b4df51fc4c99ecf27fa4d1f1cd2c29a8289932'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.0/ccli_0.4.0_linux_amd64.tar.gz'
      sha256 '1a692de0366d6f421f55a8d6793720b1f3a807baf2a960a6d1cf913fa1de39e7'
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
