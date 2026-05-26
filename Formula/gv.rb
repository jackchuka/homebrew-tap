class Gv < Formula
  desc 'Git Vision - monitor multiple git repositories'
  version '0.1.8'
  homepage 'https://github.com/jackchuka/gv'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.8/gv_0.1.8_darwin_arm64.tar.gz'
      sha256 '43709fc112af701644a7b50791f4d4157619fbd8f09227f76d04df187f614e0f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.8/gv_0.1.8_darwin_amd64.tar.gz'
      sha256 '0e948e3ac1131c512e8de881136116c39bc78a42951d8fb2451071fd3152c829'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.8/gv_0.1.8_linux_arm64.tar.gz'
      sha256 '1b22c1327066b18626f45ab160e2c9c9e0acf8f1bc9dc442aee1a31819b75c53'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.8/gv_0.1.8_linux_amd64.tar.gz'
      sha256 '3df4c1a15df888659a92f292b7899178436cf9d26201c5e318b6885ec54ee4d4'
    end
  end

  head do
    url 'https://github.com/jackchuka/gv.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'gv'
  end
end
