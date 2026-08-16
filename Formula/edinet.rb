class Edinet < Formula
  desc 'A single-binary CLI for EDINET — search, download, and extract Japanese corporate filings from the FSA disclosure system'
  version '0.2.0'
  homepage 'https://github.com/jackchuka/edinet-cli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/edinet-cli/releases/download/v0.2.0/edinet_0.2.0_darwin_arm64.tar.gz'
      sha256 '3d2c467bcc0b4cd00b9f2d7117668400d6325d2cbdc48e819173cbb4693bfda2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/edinet-cli/releases/download/v0.2.0/edinet_0.2.0_darwin_amd64.tar.gz'
      sha256 'fa9e1bf4806b1431cace1f1b1b77b1c45e6d17f16c534a06ede1dd5d63bcdaf3'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/edinet-cli/releases/download/v0.2.0/edinet_0.2.0_linux_arm64.tar.gz'
      sha256 'c441d16aae0e85112787dd736c024598243c81d1131277457b3a708632a72b79'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/edinet-cli/releases/download/v0.2.0/edinet_0.2.0_linux_amd64.tar.gz'
      sha256 '65e50d8aeecc06c7434b13ea3ea5cb790fe6809dad586a574e4ad145dab956ec'
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
