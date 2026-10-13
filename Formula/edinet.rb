class Edinet < Formula
  desc 'A single-binary CLI for EDINET — search, download, and extract Japanese corporate filings from the FSA disclosure system'
  version '0.2.2'
  homepage 'https://github.com/jackchuka/edinet-cli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/edinet-cli/releases/download/v0.2.2/edinet_0.2.2_darwin_arm64.tar.gz'
      sha256 '1f60b0e88cfb91c1151463e38a0170f0e04c2bac34ffc06c36e12ed9482b3125'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/edinet-cli/releases/download/v0.2.2/edinet_0.2.2_darwin_amd64.tar.gz'
      sha256 '1a31bd3d38a3e0452fcee7f17eed498fe56b2a4dd4f2827d9f2dd14c81fbf9d2'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/edinet-cli/releases/download/v0.2.2/edinet_0.2.2_linux_arm64.tar.gz'
      sha256 '04c35870e3199a45c8d4ecba4531807f105f2a6998cbb3be0c689ec9fbbd491a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/edinet-cli/releases/download/v0.2.2/edinet_0.2.2_linux_amd64.tar.gz'
      sha256 '58e792ae94b1e524b606e3fadd616d6d5dac4f940b721ac2dafcbc64d302876e'
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
