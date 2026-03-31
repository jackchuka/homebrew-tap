class Slackcli < Formula
  desc 'The Slack CLI and MCP server built for LLM-powered agents and programmatic access.'
  version '0.3.4'
  homepage 'https://github.com/jackchuka/slackcli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.4/slackcli_0.3.4_darwin_arm64.tar.gz'
      sha256 '977a3753fe0993ddd59855da8ada45b464786870d593c8f105230bcd99d76ac7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.4/slackcli_0.3.4_darwin_amd64.tar.gz'
      sha256 '70ad258e7d8179c1d4017a40567528de80ac80c935f0c50e63ae7504bbfb7fd0'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.4/slackcli_0.3.4_linux_arm64.tar.gz'
      sha256 '8aec3207275e3fb16ea9a9da58fe1f46e563fec888b1108e43c8cb6870178502'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/slackcli/releases/download/v0.3.4/slackcli_0.3.4_linux_amd64.tar.gz'
      sha256 '60967b55eec4d571eeb639d241b35a12aa193d17e25f715d33db27e3da2c169a'
    end
  end

  head do
    url 'https://github.com/jackchuka/slackcli.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'slackcli'
  end
end
