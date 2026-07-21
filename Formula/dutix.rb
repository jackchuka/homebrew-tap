class Dutix < Formula
  desc 'Set default apps, migrate file associations, and manage handlers on macOS'
  version '0.2.1'
  homepage 'https://github.com/jackchuka/dutix'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/dutix/releases/download/v0.2.1/dutix_0.2.1_darwin_arm64.tar.gz'
      sha256 '94901c9652f41306ba373fc9dbe4ccf7b5b99ac00787ac3f02d79fafa9b17ecc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/dutix/releases/download/v0.2.1/dutix_0.2.1_darwin_amd64.tar.gz'
      sha256 'c1af4cbb1913a5f54e194bbdc6221f1389e6b06b8162cce9c05dcc83353899a8'
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
