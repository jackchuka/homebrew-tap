class Goalias < Formula
  desc 'Instantly standardize Go import aliases across your entire codebase with LSP-powered precision.'
  version '1.0.13'
  homepage 'https://github.com/jackchuka/goalias'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.13/goalias_1.0.13_darwin_arm64.tar.gz'
      sha256 'fae4f78ae762cac81ff6e77125c25b1246bebec38d704fb2458c293d4fb68ef0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.13/goalias_1.0.13_darwin_amd64.tar.gz'
      sha256 '213be35668129edf15955c16e15a8cde2af248ec68518a82dfbdc6d147de3176'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.13/goalias_1.0.13_linux_arm64.tar.gz'
      sha256 '6c8d67e55e00cab2955fba094a3c50ffe4ca97637ab0b5729bb865b05e755e98'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.13/goalias_1.0.13_linux_amd64.tar.gz'
      sha256 'cb6fa37856911d28677e12032291566553525f55949f3da23b967c63d5480e58'
    end
  end

  head do
    url 'https://github.com/jackchuka/goalias.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'goalias'
  end
end
