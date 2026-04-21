class Dutix < Formula
  desc 'Set default apps, migrate file associations, and manage handlers on macOS'
  version '0.1.7'
  homepage 'https://github.com/jackchuka/dutix'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/dutix/releases/download/v0.1.7/dutix_0.1.7_darwin_arm64.tar.gz'
      sha256 '42ed946708a416c21a1cb25689a30fb031c48a6fd433725e3fb70752900636d7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/dutix/releases/download/v0.1.7/dutix_0.1.7_darwin_amd64.tar.gz'
      sha256 '374d215dcb0cb54364a3f7ec2bd28537af9ed16567a69377d973981e8085a8b7'
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
