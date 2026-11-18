class Edinet < Formula
  desc 'A single-binary CLI for EDINET — search, download, and extract Japanese corporate filings from the FSA disclosure system'
  version '0.2.4'
  homepage 'https://github.com/jackchuka/edinet-cli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/edinet-cli/releases/download/v0.2.4/edinet_0.2.4_darwin_arm64.tar.gz'
      sha256 '695a5cb465316aef88e5186ac6a7d2738fa8ffbbde19b94295ce826228c3b16c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/edinet-cli/releases/download/v0.2.4/edinet_0.2.4_darwin_amd64.tar.gz'
      sha256 '388dbbea63f4f7ca4c68434b3d2bcd2642d609b5562dd8c53cb2b08545174cdc'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/edinet-cli/releases/download/v0.2.4/edinet_0.2.4_linux_arm64.tar.gz'
      sha256 '7658f1a56376098705f861214379e8b59dce180ce278af82f086b7bde8c02777'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/edinet-cli/releases/download/v0.2.4/edinet_0.2.4_linux_amd64.tar.gz'
      sha256 '944bd48d57d85a58f86b06e41e12d7c4382843531886d9d1fe540c8617cc35ef'
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
