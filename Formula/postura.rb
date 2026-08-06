class Postura < Formula
  desc 'A deterministic CLI that audits your GitHub enterprise, orgs, and repos against a security baseline you own — rules are data, the bar is per-target.'
  version '0.3.0'
  homepage 'https://github.com/jackchuka/postura'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/postura/releases/download/v0.3.0/postura_0.3.0_darwin_arm64.tar.gz'
      sha256 '2cfe06739aafd587fe09c04090477ef884a8de09a35964b4cff109a4fb9e28e0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/postura/releases/download/v0.3.0/postura_0.3.0_darwin_amd64.tar.gz'
      sha256 '7465ab48737d809c1f642501d642954d597594ab9598f14e2c67416291d0ca53'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/postura/releases/download/v0.3.0/postura_0.3.0_linux_arm64.tar.gz'
      sha256 'f6b470d5b8a8cc2f11477ce1cfddf1c31bf34e0e19d3176b4379ba0f29879cf6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/postura/releases/download/v0.3.0/postura_0.3.0_linux_amd64.tar.gz'
      sha256 'f1bd01e6a1464580763baf5baad09d704d3c36307c6ef5cc0021dc18653429cf'
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
