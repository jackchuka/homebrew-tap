class Goalias < Formula
  desc 'Instantly standardize Go import aliases across your entire codebase with LSP-powered precision.'
  version '1.0.2'
  homepage 'https://github.com/jackchuka/goalias'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.2/goalias_1.0.2_darwin_arm64.tar.gz'
      sha256 '03fb6b199829ff933ea6b90ca126b2f6b57877404f42ac699ae57ead90603318'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.2/goalias_1.0.2_darwin_amd64.tar.gz'
      sha256 'c3dde4f9bd32f8c9d1dbca4cf818fafd2e81c1096bb57ec1c67e9289ce84a7da'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.2/goalias_1.0.2_linux_arm64.tar.gz'
      sha256 '855b9fb901109d4f8642a0b00daa3a36ff4dbb8459444b2e6a5f93bd3830ed1f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.2/goalias_1.0.2_linux_amd64.tar.gz'
      sha256 'b904fa23694edbb57364ab917d8a13979ab24aaee1fa32644b43b34b2c65b3c8'
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
