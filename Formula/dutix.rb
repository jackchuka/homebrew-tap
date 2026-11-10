class Dutix < Formula
  desc 'Set default apps, migrate file associations, and manage handlers on macOS'
  version '0.4.0'
  homepage 'https://github.com/jackchuka/dutix'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/dutix/releases/download/v0.4.0/dutix_0.4.0_darwin_arm64.tar.gz'
      sha256 '6beb9a3f129f5470c1f61a7fadb3112f5ff41bcf9c497c8a63559ff634c7c741'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/dutix/releases/download/v0.4.0/dutix_0.4.0_darwin_amd64.tar.gz'
      sha256 'ff8217d98c4524eedf061d987657d3a73321083bb331f108ea277925e59d7f0c'
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
