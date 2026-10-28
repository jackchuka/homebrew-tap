class Dutix < Formula
  desc 'Set default apps, migrate file associations, and manage handlers on macOS'
  version '0.3.0'
  homepage 'https://github.com/jackchuka/dutix'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/dutix/releases/download/v0.3.0/dutix_0.3.0_darwin_arm64.tar.gz'
      sha256 'feb24b319507b7baa2092950c6d922827c7ed6ed667b18d97d25cebdf069b2b6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/dutix/releases/download/v0.3.0/dutix_0.3.0_darwin_amd64.tar.gz'
      sha256 '4d5a4a5acc44f090236b777765c06d1dcd1de8ad538e0940631bb6b85a3a5b94'
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
