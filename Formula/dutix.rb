class Dutix < Formula
  desc 'Set default apps, migrate file associations, and manage handlers on macOS'
  version '0.1.8'
  homepage 'https://github.com/jackchuka/dutix'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/dutix/releases/download/v0.1.8/dutix_0.1.8_darwin_arm64.tar.gz'
      sha256 '05bc8827149515d136591ec6d1b5750140147b9d087293a56cfb1e13a401a7c4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/dutix/releases/download/v0.1.8/dutix_0.1.8_darwin_amd64.tar.gz'
      sha256 '3681ce88661a69ddbb5bc52395854a6d217c0548c82b1dfae78719a5c5a342ca'
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
