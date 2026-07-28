class Postura < Formula
  desc 'A deterministic CLI that audits your GitHub enterprise, orgs, and repos against a security baseline you own — rules are data, the bar is per-target.'
  version '0.2.4'
  homepage 'https://github.com/jackchuka/postura'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/postura/releases/download/v0.2.4/postura_0.2.4_darwin_arm64.tar.gz'
      sha256 '24ea3df950a661558422b0e16307375cb46155ed0884ff8084c8b897f69b9d9a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/postura/releases/download/v0.2.4/postura_0.2.4_darwin_amd64.tar.gz'
      sha256 '22ffe2d6d62e928725b2b3ee9629ff59636107b1df573a27db9ecb365ccd71ae'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/postura/releases/download/v0.2.4/postura_0.2.4_linux_arm64.tar.gz'
      sha256 '847b800b0e2367ae8c8c39a24678f4f9c48af294bd76cb155f3d2652d9416a89'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/postura/releases/download/v0.2.4/postura_0.2.4_linux_amd64.tar.gz'
      sha256 '0c80cd613b5a5e8872fe9836d41a627ee7411c61300a0ee7d7795d2caef7badd'
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
