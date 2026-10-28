class Dutix < Formula
  desc 'Set default apps, migrate file associations, and manage handlers on macOS'
  version '0.3.1'
  homepage 'https://github.com/jackchuka/dutix'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/dutix/releases/download/v0.3.1/dutix_0.3.1_darwin_arm64.tar.gz'
      sha256 '60519504df7a312c306772607b40f56ea933dc71fec50abf2c079eda25c1ebbb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/dutix/releases/download/v0.3.1/dutix_0.3.1_darwin_amd64.tar.gz'
      sha256 '967e9937d8e75adc8413050e63c6e27a3d260fcd013cafe5a522e7df7253907b'
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
