class Postura < Formula
  desc 'A deterministic CLI that audits your GitHub enterprise, orgs, and repos against a security baseline you own — rules are data, the bar is per-target.'
  version '0.4.2'
  homepage 'https://github.com/jackchuka/postura'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/postura/releases/download/v0.4.2/postura_0.4.2_darwin_arm64.tar.gz'
      sha256 '5dc8daf8aa7e7e48596c0970c57d2e86437ada23dfdb56d9529608a299cde896'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/postura/releases/download/v0.4.2/postura_0.4.2_darwin_amd64.tar.gz'
      sha256 '10f9ab571ee40bc8bc3c33cc9915fa639c7e393d354ce982bac16411d8636516'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/postura/releases/download/v0.4.2/postura_0.4.2_linux_arm64.tar.gz'
      sha256 '1c4572a20dc9405957ffd1008a42fa742196be058c26d30384850c0244ba60fe'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/postura/releases/download/v0.4.2/postura_0.4.2_linux_amd64.tar.gz'
      sha256 'cb66d01d5c0c22a8f0226c7b451fe025cc561dc8d1b60803ffc15c25d4c9a212'
    end
  end

  head do
    url 'https://github.com/jackchuka/postura.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'go', 'build', '-o', 'postura', '.'
    end
    bin.install 'postura'
  end

  test do
    system "#{bin}/postura", '-h'
  end
end
