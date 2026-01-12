class Dutix < Formula
  desc 'Set default apps, migrate file associations, and manage handlers on macOS'
  version '0.1.0'
  homepage 'https://github.com/jackchuka/dutix'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/dutix/releases/download/v0.1.0/dutix_0.1.0_darwin_arm64.tar.gz'
      sha256 'b7a42eebf502bd5b90e6401956ccfd58e41cc4c5a307987ff06fbb4b0fe79d4d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/dutix/releases/download/v0.1.0/dutix_0.1.0_darwin_amd64.tar.gz'
      sha256 'f6fd43762cbf112c2eb71feb8fc085594989f1ba9e444a9f4d1f8afb0e181e3b'
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
