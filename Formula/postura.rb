class Postura < Formula
  desc 'A deterministic CLI that audits your GitHub enterprise, orgs, and repos against a security baseline you own — rules are data, the bar is per-target.'
  version '0.4.1'
  homepage 'https://github.com/jackchuka/postura'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/postura/releases/download/v0.4.1/postura_0.4.1_darwin_arm64.tar.gz'
      sha256 '93b40a5676fdd2f8d3dde147983cee4d6d6031ac78427acce84fcdc4076be9d3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/postura/releases/download/v0.4.1/postura_0.4.1_darwin_amd64.tar.gz'
      sha256 'f7c66e61b310f0e3e155f57b749b4d072c8c829aecf5e9b3c2a9e9778f950fdd'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/postura/releases/download/v0.4.1/postura_0.4.1_linux_arm64.tar.gz'
      sha256 '030b737baa4bbc51f1fc84c9afc41e8f2e2c4fa94bec1887600d8185fd393249'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/postura/releases/download/v0.4.1/postura_0.4.1_linux_amd64.tar.gz'
      sha256 'e713c5b9af96b2a2d47200045297cd617f603492ffcc5193c8fcea97bda7804b'
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
