class Ccli < Formula
  desc 'A unified CLI for inspecting your Claude Code installation — MCP servers, skills, rules, projects, and metadata.'
  version '0.5.3'
  homepage 'https://github.com/jackchuka/ccli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.5.3/ccli_0.5.3_darwin_arm64.tar.gz'
      sha256 'd0b3492ebcbbe1ac83d17e21d2f39fb550cd6cc875aede71c98bf06bc78f2eb7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.5.3/ccli_0.5.3_darwin_amd64.tar.gz'
      sha256 '004cbea11b57882d260b73205a2f5979f091700bd6052055df05ffd27acbb3f2'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.5.3/ccli_0.5.3_linux_arm64.tar.gz'
      sha256 'e08e84442263899e8bebd480eb0145106eb62947f8129fcc371f268414c94e2e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.5.3/ccli_0.5.3_linux_amd64.tar.gz'
      sha256 'ac8be771d3e1b86350bab093d2012a7a666d4b44ec3565f4709c8b97ba75bc67'
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
