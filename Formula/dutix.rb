class Dutix < Formula
  desc 'Set default apps, migrate file associations, and manage handlers on macOS'
  version '0.2.3'
  homepage 'https://github.com/jackchuka/dutix'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/dutix/releases/download/v0.2.3/dutix_0.2.3_darwin_arm64.tar.gz'
      sha256 '2ebca4e973aa096bedc9aecf64e1891a3c206d034cb690382ee6c4c8fa3ef804'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/dutix/releases/download/v0.2.3/dutix_0.2.3_darwin_amd64.tar.gz'
      sha256 '35347d275100926b32015a88eb1dd79538049f4481de1973cdd1453fe67e9075'
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
