class Ccli < Formula
  desc 'A unified CLI for inspecting your Claude Code installation — MCP servers, skills, rules, projects, and metadata.'
  version '0.5.0'
  homepage 'https://github.com/jackchuka/ccli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.5.0/ccli_0.5.0_darwin_arm64.tar.gz'
      sha256 'bcb5659d62ffd004208bbadf2f67b3d042ed7542c44c44cbdb1c9f01c48a7dab'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.5.0/ccli_0.5.0_darwin_amd64.tar.gz'
      sha256 '051181ddfbfb9c8bd21225c90501ee626618b90b1d3ff9498868ca51f24e504a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.5.0/ccli_0.5.0_linux_arm64.tar.gz'
      sha256 '36536150bb773cfd21380cbdc7834ee0195d8629732bba06db8ec238cea923c1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.5.0/ccli_0.5.0_linux_amd64.tar.gz'
      sha256 'bc1ab266d556319f92cbc4207e602b0a605ba9b85773a6ed1bf0fa4293964e87'
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
