class Ccli < Formula
  desc 'A unified CLI for inspecting your Claude Code installation — MCP servers, skills, rules, projects, and metadata.'
  version '0.2.0'
  homepage 'https://github.com/jackchuka/ccli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.2.0/ccli_0.2.0_darwin_arm64.tar.gz'
      sha256 'd97a3076d0478e70fcfec2e89e680f1e4dd69e17c54d2a3786df4632a775b142'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.2.0/ccli_0.2.0_darwin_amd64.tar.gz'
      sha256 'd44643df14abc66f234d454fe136b2ac12c66b9641346c6869497e1a42d7b79a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.2.0/ccli_0.2.0_linux_arm64.tar.gz'
      sha256 '670d808545bfbc9a11b96bcfacb495bc36e392b3eadb0d19df53a035e0da13fc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.2.0/ccli_0.2.0_linux_amd64.tar.gz'
      sha256 'db49e4d21c703a5c5ed159a50dc18ff63e99a8f9bcbd1163833c02a9ddedd363'
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
