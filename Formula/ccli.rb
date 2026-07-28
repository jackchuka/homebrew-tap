class Ccli < Formula
  desc 'A unified CLI for inspecting your Claude Code installation — MCP servers, skills, rules, projects, and metadata.'
  version '0.4.11'
  homepage 'https://github.com/jackchuka/ccli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.11/ccli_0.4.11_darwin_arm64.tar.gz'
      sha256 '7eea81c332e3beacbba8bc54cb82baf717e472f70b135b3946de7b241665c6fe'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.11/ccli_0.4.11_darwin_amd64.tar.gz'
      sha256 '6e244c65dee1faa615b8cfc22edc5211479e3cc7bfbf2e30854790b1e61aedc3'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.11/ccli_0.4.11_linux_arm64.tar.gz'
      sha256 '486c162cb281d2eee080e10aa6aca0345e67cd8a3348fdd9c8a720ecc1c3fa08'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.11/ccli_0.4.11_linux_amd64.tar.gz'
      sha256 '5d08bbabbd4b2ffb1f7f9f85ac9235704aa46a7a75d5f1d2a1e50ad68b1e26da'
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
