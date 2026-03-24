class Dutix < Formula
  desc 'Set default apps, migrate file associations, and manage handlers on macOS'
  version '0.1.5'
  homepage 'https://github.com/jackchuka/dutix'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/dutix/releases/download/v0.1.5/dutix_0.1.5_darwin_arm64.tar.gz'
      sha256 'cea3860a9314cec8ac2e2649821e830daccbadde0f674958e5a5a08b6aa2d590'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/dutix/releases/download/v0.1.5/dutix_0.1.5_darwin_amd64.tar.gz'
      sha256 'a417ed079b2eeaee39072c9540b15ca2b0ccfd42b8f9b2939d2e0e1394b0a362'
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
