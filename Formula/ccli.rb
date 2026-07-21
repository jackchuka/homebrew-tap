class Ccli < Formula
  desc 'A unified CLI for inspecting your Claude Code installation — MCP servers, skills, rules, projects, and metadata.'
  version '0.4.10'
  homepage 'https://github.com/jackchuka/ccli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.10/ccli_0.4.10_darwin_arm64.tar.gz'
      sha256 '8a4009501ede5d0c3060bae83d5a20952784e946a1cd4ae96fd96c32b4d1cf1a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.10/ccli_0.4.10_darwin_amd64.tar.gz'
      sha256 'e693117c1d9579d67375a06281383d374fa946b09935ae5242bc3a1717877b3c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.10/ccli_0.4.10_linux_arm64.tar.gz'
      sha256 '5ec096ac223bfd130b97f23df79cf4527e0157eb329ac93ceb472a8634acdd05'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.10/ccli_0.4.10_linux_amd64.tar.gz'
      sha256 'dfa8e8019070c6ecec6b5633902523efb200dae087e9f08ed4a982fba3a37801'
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
