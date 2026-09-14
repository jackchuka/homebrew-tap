class Edinet < Formula
  desc 'A single-binary CLI for EDINET — search, download, and extract Japanese corporate filings from the FSA disclosure system'
  version '0.2.1'
  homepage 'https://github.com/jackchuka/edinet-cli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/edinet-cli/releases/download/v0.2.1/edinet_0.2.1_darwin_arm64.tar.gz'
      sha256 '419c797656c2dd828b8a4fa9f7cb9491467b10888d023dd92534ac5d3a3a3102'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/edinet-cli/releases/download/v0.2.1/edinet_0.2.1_darwin_amd64.tar.gz'
      sha256 '17ed6e285726485347d1ec48a291064718291da53ffe215540684272195ad01f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/edinet-cli/releases/download/v0.2.1/edinet_0.2.1_linux_arm64.tar.gz'
      sha256 'c1cb2390f2feb2963441cc724b5e56b948a8a9b90d60eb9760759aea9daf9058'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/edinet-cli/releases/download/v0.2.1/edinet_0.2.1_linux_amd64.tar.gz'
      sha256 'efcdfc5c8cd0f5da573b43e6acfc10bf8a30b002dab4c9f4f35baaf45402e918'
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
