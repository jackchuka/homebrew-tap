class Dutix < Formula
  desc 'Set default apps, migrate file associations, and manage handlers on macOS'
  version '0.2.2'
  homepage 'https://github.com/jackchuka/dutix'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/dutix/releases/download/v0.2.2/dutix_0.2.2_darwin_arm64.tar.gz'
      sha256 '34bae045f070e4ff6ec672e03c655b17c457dcbe02dc4fef8bf2430c0f787b48'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/dutix/releases/download/v0.2.2/dutix_0.2.2_darwin_amd64.tar.gz'
      sha256 '85d75329ddb97a63ed591a7ca448641e80fba7636429bd269ad89125104fcb34'
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
