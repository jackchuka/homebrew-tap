class Dutix < Formula
  desc 'Set default apps, migrate file associations, and manage handlers on macOS'
  version '0.5.0'
  homepage 'https://github.com/jackchuka/dutix'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/dutix/releases/download/v0.5.0/dutix_0.5.0_darwin_arm64.tar.gz'
      sha256 'b5f93ce1a1f22653a04fbf1a4323df2b47f69e70967ce6e21409379a242926f3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/dutix/releases/download/v0.5.0/dutix_0.5.0_darwin_amd64.tar.gz'
      sha256 '7f82c9cc7147e9afc38c177b9b45d9a48b4ac9bc65684cc88a47fb4ff0adf242'
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
