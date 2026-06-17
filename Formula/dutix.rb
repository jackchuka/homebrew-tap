class Dutix < Formula
  desc 'Set default apps, migrate file associations, and manage handlers on macOS'
  version '0.1.10'
  homepage 'https://github.com/jackchuka/dutix'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/dutix/releases/download/v0.1.10/dutix_0.1.10_darwin_arm64.tar.gz'
      sha256 'f138f9697c9232bbfaaafd9885bdd188d526765a1eaf97b128fe4f262dcd4f88'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/dutix/releases/download/v0.1.10/dutix_0.1.10_darwin_amd64.tar.gz'
      sha256 '4d7005f7e31fc8524df06393915a5d8591dd15e10fd85bec84bda23de836a7ef'
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
