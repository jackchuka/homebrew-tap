class Ccli < Formula
  desc 'A unified CLI for inspecting your Claude Code installation — MCP servers, skills, rules, projects, and metadata.'
  version '0.5.4'
  homepage 'https://github.com/jackchuka/ccli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.5.4/ccli_0.5.4_darwin_arm64.tar.gz'
      sha256 '555ed87106ecac1a644cd03293d025db05bbf7b972d174fea55d54e24c4d0fc9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.5.4/ccli_0.5.4_darwin_amd64.tar.gz'
      sha256 '1a76b1e9822130e8b8f1c6c63da943ef7f3ff111fc5bda2c0203779e947b561f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.5.4/ccli_0.5.4_linux_arm64.tar.gz'
      sha256 '61e40d4ba7526032a24f3560afd1a858e6a1db00234c5801e3ba078f5d861206'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.5.4/ccli_0.5.4_linux_amd64.tar.gz'
      sha256 '30e7a14203d170a15182bf88b98ca3cab037db7f818dc34c9f261f791b011581'
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
