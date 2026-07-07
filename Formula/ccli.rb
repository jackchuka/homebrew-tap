class Ccli < Formula
  desc 'A unified CLI for inspecting your Claude Code installation — MCP servers, skills, rules, projects, and metadata.'
  version '0.4.8'
  homepage 'https://github.com/jackchuka/ccli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.8/ccli_0.4.8_darwin_arm64.tar.gz'
      sha256 '6f693b4e03b1dff10b4985a1014ee71c6452c6c00b796fa9818ab4556ba047ae'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.8/ccli_0.4.8_darwin_amd64.tar.gz'
      sha256 'f6b60c4c677941c40a18f843ce566624b69ef33fdb7ecbbd904be8a1a6e6454c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.8/ccli_0.4.8_linux_arm64.tar.gz'
      sha256 'de6748de185dcfd1db5b29343f6e81d5d443501b2d55e60ba3b1316fe99f7dd6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/ccli/releases/download/v0.4.8/ccli_0.4.8_linux_amd64.tar.gz'
      sha256 '1a6da4aee239579e9b7938dc9a171e271d012cfab46514ebcfcd35ecabd313f0'
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
