class Dutix < Formula
  desc 'Set default apps, migrate file associations, and manage handlers on macOS'
  version '0.2.0'
  homepage 'https://github.com/jackchuka/dutix'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/dutix/releases/download/v0.2.0/dutix_0.2.0_darwin_arm64.tar.gz'
      sha256 'e2bd2cf48420096b10b53436d75335810870c32e04e477ac5c9700dad397d6e3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/dutix/releases/download/v0.2.0/dutix_0.2.0_darwin_amd64.tar.gz'
      sha256 'd60f2d2c90d074422d292976e11c46611bfa545390c9131f25d2c79ad8acc3f5'
    end
  end

  head do
    url 'https://github.com/jackchuka/dutix.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'dutix'
  end
end
