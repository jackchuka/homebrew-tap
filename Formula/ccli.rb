class Ccli < Formula
  desc 'A unified CLI for inspecting your Claude Code installation — MCP servers, skills, rules, projects, and metadata.'
  version '0.5.2'
  homepage 'https://github.com/jackchuka/ccli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.5.2/ccli_0.5.2_darwin_arm64.tar.gz'
      sha256 '89087000912b341e78fe28d6df4b3b2e699980ba2d8211798cabde452f0984c6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.5.2/ccli_0.5.2_darwin_amd64.tar.gz'
      sha256 '889b6f029950cdc7057bd3dfecb89f7713788259d4ec30c446557b2f904f0b9b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.5.2/ccli_0.5.2_linux_arm64.tar.gz'
      sha256 '453daf369cfb933c16412e15556de70f94ff10206f780b7e18dbc75bb4cf3a7e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.5.2/ccli_0.5.2_linux_amd64.tar.gz'
      sha256 'c388dd3ddcb12dbe72d400fff3c8003cee6eac250f5846feb2480d150a42c1bb'
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
