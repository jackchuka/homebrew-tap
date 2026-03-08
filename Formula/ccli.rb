class Ccli < Formula
  desc 'A unified CLI for inspecting your Claude Code installation — MCP servers, skills, rules, projects, and metadata.'
  version '0.3.0'
  homepage 'https://github.com/jackchuka/ccli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.3.0/ccli_0.3.0_darwin_arm64.tar.gz'
      sha256 'f791f9c394f7c1ab61dadf5efeb1b706d239a2c98ad67add37d6feec84dd9060'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.3.0/ccli_0.3.0_darwin_amd64.tar.gz'
      sha256 '5b5605826d5427354817f7a2dedf063fd936c00b834d930b23adac20905ee905'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.3.0/ccli_0.3.0_linux_arm64.tar.gz'
      sha256 'a523084aee60523c54fd4b2ee7d7d48e316bd6055ac6a356f7d589385b3e1047'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.3.0/ccli_0.3.0_linux_amd64.tar.gz'
      sha256 '925f49f5066b4858b3eac67bedd11a6b7fd90b661062cf3c10861991b62b0e51'
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
