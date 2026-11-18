class Postura < Formula
  desc 'A deterministic CLI that audits your GitHub enterprise, orgs, and repos against a security baseline you own — rules are data, the bar is per-target.'
  version '0.4.3'
  homepage 'https://github.com/jackchuka/postura'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/postura/releases/download/v0.4.3/postura_0.4.3_darwin_arm64.tar.gz'
      sha256 '6a09c4ad91878d3440728cff70e5553414bf9464a84bce12b184e82fc3222bbc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/postura/releases/download/v0.4.3/postura_0.4.3_darwin_amd64.tar.gz'
      sha256 'a16cc3911ce2288be03faf7b0a9eb5c09ce82c4adf28770c61a6f3e8aa43b3d0'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/postura/releases/download/v0.4.3/postura_0.4.3_linux_arm64.tar.gz'
      sha256 '3580475416dbf4513da4dfff05efed900427f627f70a902e63ce0768f35e4ea9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/postura/releases/download/v0.4.3/postura_0.4.3_linux_amd64.tar.gz'
      sha256 'c66e786ef3efe9f73a7ec0e28713b8b65a95a7cae9215a9f7f485bfd8c68215b'
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
