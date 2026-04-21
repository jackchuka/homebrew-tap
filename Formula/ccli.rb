class Ccli < Formula
  desc 'A unified CLI for inspecting your Claude Code installation — MCP servers, skills, rules, projects, and metadata.'
  version '0.4.4'
  homepage 'https://github.com/jackchuka/ccli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.4/ccli_0.4.4_darwin_arm64.tar.gz'
      sha256 'b449491890316a681923e59d3763aeb5a51183a9ed23c1b3e6c54a7f01ff194d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.4/ccli_0.4.4_darwin_amd64.tar.gz'
      sha256 'de297fca03fe3490f662a75422c6e85c3c68951dfea0aa594088106c1b0ce45e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.4/ccli_0.4.4_linux_arm64.tar.gz'
      sha256 '09e31df495e0a42c0318e649858d0b578c42d3f886fa0d790db1d31d3f43ad2f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.4/ccli_0.4.4_linux_amd64.tar.gz'
      sha256 'ac44f853bd9ea719fccb468e98047725567ee85ac69996458206fbe62e2fa5c1'
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
