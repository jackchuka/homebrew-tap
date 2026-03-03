class Dutix < Formula
  desc 'Set default apps, migrate file associations, and manage handlers on macOS'
  version '0.1.2'
  homepage 'https://github.com/jackchuka/dutix'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/dutix/releases/download/v0.1.2/dutix_0.1.2_darwin_arm64.tar.gz'
      sha256 'f9949b76350b7778a71d8fd82ac8c6d1f693ccc96b242d00862b4a4c4c9b1fb4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/dutix/releases/download/v0.1.2/dutix_0.1.2_darwin_amd64.tar.gz'
      sha256 '4d3b59229ac213463ec705ac42101cfa31852b346131521e2d4cc43a39a6e8c3'
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
