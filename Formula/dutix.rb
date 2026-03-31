class Dutix < Formula
  desc 'Set default apps, migrate file associations, and manage handlers on macOS'
  version '0.1.6'
  homepage 'https://github.com/jackchuka/dutix'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/dutix/releases/download/v0.1.6/dutix_0.1.6_darwin_arm64.tar.gz'
      sha256 'dcbba18880263d85dbdb12d4e6429d1db44ae651205c687ab3722775bc19bef5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/dutix/releases/download/v0.1.6/dutix_0.1.6_darwin_amd64.tar.gz'
      sha256 '522f1f95ab311a217e3d491076221f384f55e9d22b85dc1728570d7fdc6966eb'
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
