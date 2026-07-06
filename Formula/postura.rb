class Postura < Formula
  desc 'A deterministic CLI that audits your GitHub enterprise, orgs, and repos against a security baseline you own — rules are data, the bar is per-target.'
  version '0.2.0'
  homepage 'https://github.com/jackchuka/postura'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/postura/releases/download/v0.2.0/postura_0.2.0_darwin_arm64.tar.gz'
      sha256 '48c01e44389cea64cb3d5da06d42696507ba95f7a773108ef0241045f87b5734'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/postura/releases/download/v0.2.0/postura_0.2.0_darwin_amd64.tar.gz'
      sha256 '812f8ff6aab227b23439d4729ed7b8c470bcb45c25ca43eb445918cbe3ceed97'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/postura/releases/download/v0.2.0/postura_0.2.0_linux_arm64.tar.gz'
      sha256 '9c8695d5eafefccbf5ad5d409d2f47aac80ce63bef473b66b9c88ef5f1be309f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/postura/releases/download/v0.2.0/postura_0.2.0_linux_amd64.tar.gz'
      sha256 '07e55af8a450e8d4a8fc4c3564c16b09727e4a7354806220007f23b196a24a1a'
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
