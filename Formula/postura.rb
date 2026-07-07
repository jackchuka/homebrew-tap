class Postura < Formula
  desc 'A deterministic CLI that audits your GitHub enterprise, orgs, and repos against a security baseline you own — rules are data, the bar is per-target.'
  version '0.2.1'
  homepage 'https://github.com/jackchuka/postura'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/postura/releases/download/v0.2.1/postura_0.2.1_darwin_arm64.tar.gz'
      sha256 'f593757aa98229cf0a8dc28b9bc77219cd87786448daa7c84b56d234f04ad529'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/postura/releases/download/v0.2.1/postura_0.2.1_darwin_amd64.tar.gz'
      sha256 '7bfe573510890425283fb2b0cffa6b54e36cf6c417be88008b83f2a12258e9a5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/postura/releases/download/v0.2.1/postura_0.2.1_linux_arm64.tar.gz'
      sha256 '2334ac4db7d9cc6e8bb37d80345c93c21e1ba6b0953788686ec9c3343c5cb8ee'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/postura/releases/download/v0.2.1/postura_0.2.1_linux_amd64.tar.gz'
      sha256 '488342635cb7d29cde4d229fc50168bd0d0bad3d40a5b1de907820da811bb17e'
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
