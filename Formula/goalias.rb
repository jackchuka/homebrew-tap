class Goalias < Formula
  desc 'Instantly standardize Go import aliases across your entire codebase with LSP-powered precision.'
  version '1.0.11'
  homepage 'https://github.com/jackchuka/goalias'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.11/goalias_1.0.11_darwin_arm64.tar.gz'
      sha256 'd3ff96154c10c10bb2bb7244fc3f7ac73831e0798e01e719c7ddf2e0642fe927'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.11/goalias_1.0.11_darwin_amd64.tar.gz'
      sha256 '9d8b21e69f54de605c35cbcc4b0020618077345893b608a580a97cbeb2539e31'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.11/goalias_1.0.11_linux_arm64.tar.gz'
      sha256 'd16e3871e05dd41688d227830801e05febf661cc6cbf956fb6dcdcf1584c1bef'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.11/goalias_1.0.11_linux_amd64.tar.gz'
      sha256 '09b44b8c0abecaf36463702b9664fa28de93d2b9277076379ce859b32b91f7e0'
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
