class Dutix < Formula
  desc 'Set default apps, migrate file associations, and manage handlers on macOS'
  version '0.1.9'
  homepage 'https://github.com/jackchuka/dutix'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/dutix/releases/download/v0.1.9/dutix_0.1.9_darwin_arm64.tar.gz'
      sha256 '6b11f45b6482ab134b9ec5e0dff135692acf577a5fd609cc58c60cafba64e354'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/dutix/releases/download/v0.1.9/dutix_0.1.9_darwin_amd64.tar.gz'
      sha256 '32a73204e4d38c23cea81ddcbcfd7761b988831a678afc3a243a00692bdbd831'
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
