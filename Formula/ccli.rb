class Ccli < Formula
  desc 'A unified CLI for inspecting your Claude Code installation — MCP servers, skills, rules, projects, and metadata.'
  version '0.4.3'
  homepage 'https://github.com/jackchuka/ccli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.3/ccli_0.4.3_darwin_arm64.tar.gz'
      sha256 '2136dd8993fee6cf82485f3651c9433c4acd88e0dea62f6896c3781ab234ba56'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.3/ccli_0.4.3_darwin_amd64.tar.gz'
      sha256 'ba0fb9eccf059bd717847139641da8be3dfacf739436be83e4da7cac8f80ba10'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.3/ccli_0.4.3_linux_arm64.tar.gz'
      sha256 '48978194b21a5510ad4b65ed83172cdfc563821d03c95e6198c435b21d6bf345'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.3/ccli_0.4.3_linux_amd64.tar.gz'
      sha256 '461a631edddea557add51ad035cd92762f0e823f503d8126b7840b5ff4718375'
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
