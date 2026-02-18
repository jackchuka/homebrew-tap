class Dutix < Formula
  desc 'Set default apps, migrate file associations, and manage handlers on macOS'
  version '0.1.1'
  homepage 'https://github.com/jackchuka/dutix'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/dutix/releases/download/v0.1.1/dutix_0.1.1_darwin_arm64.tar.gz'
      sha256 '54831cf74f8779c2f13518e172c530b9ade602176da4af5dbd5cd9a8d2a9ea4e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/dutix/releases/download/v0.1.1/dutix_0.1.1_darwin_amd64.tar.gz'
      sha256 'b9ddeac213533509045940aeb8f34ee748dce04a82ec341fbe8e6d3481e5e159'
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
