class Edinet < Formula
  desc 'A single-binary CLI for EDINET — search, download, and extract Japanese corporate filings from the FSA disclosure system'
  version '0.2.3'
  homepage 'https://github.com/jackchuka/edinet-cli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/edinet-cli/releases/download/v0.2.3/edinet_0.2.3_darwin_arm64.tar.gz'
      sha256 '7473bc9e578db5d8115b4f6e314bb3d468c3e48f2c090b3dab1eb6286d47508b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/edinet-cli/releases/download/v0.2.3/edinet_0.2.3_darwin_amd64.tar.gz'
      sha256 '872dd42970cbca2dcd5319df9499e0cc2a17477fc202c15fca9ad3053984a60e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/edinet-cli/releases/download/v0.2.3/edinet_0.2.3_linux_arm64.tar.gz'
      sha256 'cbbcb57750cda9679ad6872615961e0bfb39974be745db1880bc88af03619a96'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/edinet-cli/releases/download/v0.2.3/edinet_0.2.3_linux_amd64.tar.gz'
      sha256 'a5b3d1d34c79a9240dd5d473ca98216c47a228b730f9c2dbbe96ec89830ea339'
    end
  end

  head do
    url 'https://github.com/jackchuka/edinet-cli.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'go', 'build', '-o', 'edinet', './cmd/edinet'
    end
    bin.install 'edinet'
  end
end
