class Postura < Formula
  desc 'A deterministic CLI that audits your GitHub enterprise, orgs, and repos against a security baseline you own — rules are data, the bar is per-target.'
  version '0.2.2'
  homepage 'https://github.com/jackchuka/postura'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/postura/releases/download/v0.2.2/postura_0.2.2_darwin_arm64.tar.gz'
      sha256 'e1f65c7a2f98643454705934c33b693fc494864596455f937507e2b1072c3c05'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/postura/releases/download/v0.2.2/postura_0.2.2_darwin_amd64.tar.gz'
      sha256 'c6a5fdbbd1df26bdbab732e05cc1a2fe15c069257f95c9ff724bda43679cf32e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/postura/releases/download/v0.2.2/postura_0.2.2_linux_arm64.tar.gz'
      sha256 'b2fbc5147d20b6c0c28f3d74ff5646ef16076589f50341789fe42fb91ed1beba'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/postura/releases/download/v0.2.2/postura_0.2.2_linux_amd64.tar.gz'
      sha256 'ec75d7bf452e2fa8811e9bef2cb24f5c63170f89a9852dfbbc8fe971cdb8fd7b'
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
