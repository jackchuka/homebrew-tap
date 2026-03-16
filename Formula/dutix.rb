class Dutix < Formula
  desc 'Set default apps, migrate file associations, and manage handlers on macOS'
  version '0.1.4'
  homepage 'https://github.com/jackchuka/dutix'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/dutix/releases/download/v0.1.4/dutix_0.1.4_darwin_arm64.tar.gz'
      sha256 'ce2a91dfe639ee9005eaa000b0be75bc0a160f9f9dccf295ca288e256f352680'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/dutix/releases/download/v0.1.4/dutix_0.1.4_darwin_amd64.tar.gz'
      sha256 '950d9975361e5aef7d98e311fce7913fd9f94fe0f21a5dcb3fcdd4a9131dbf28'
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
