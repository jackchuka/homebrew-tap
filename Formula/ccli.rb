class Ccli < Formula
  desc 'A unified CLI for inspecting your Claude Code installation — MCP servers, skills, rules, projects, and metadata.'
  version '0.4.7'
  homepage 'https://github.com/jackchuka/ccli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.7/ccli_0.4.7_darwin_arm64.tar.gz'
      sha256 '12bb78be135175f46196b6e7055c9b7d0391b53f4535a0b3b40879fcae3e0bc0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.7/ccli_0.4.7_darwin_amd64.tar.gz'
      sha256 '573044c1ecd8c4e4a111495aa1e96c1280903f33d85b68813351394c293c963b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.7/ccli_0.4.7_linux_arm64.tar.gz'
      sha256 '60bf5379cd40cbaf50a7af5aa37558cd9b78c48b80cbaa202bd3e527dbed95c5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.7/ccli_0.4.7_linux_amd64.tar.gz'
      sha256 '4442301177e78b496e99115670cb114001553ec790b952c7c56db3696792e3db'
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
