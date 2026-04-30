class Hpp < Formula
  desc 'CLI tool for searching Japanese restaurants using the HotPepper Gourmet API'
  version '0.2.4'
  homepage 'https://github.com/jackchuka/hpp'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.4/hpp_0.2.4_darwin_arm64.tar.gz'
      sha256 '0bdc322839e7a5e8c49cfdd86be52fbbcb94bd0f2d5905f064733741c0c9d877'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.4/hpp_0.2.4_darwin_amd64.tar.gz'
      sha256 'c49f79d0e9fa81e9e08cb3b4637830ac43ae32e0292509de849040462a245ca2'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.4/hpp_0.2.4_linux_arm64.tar.gz'
      sha256 'cc79ad17b70fb31038e31a94ddc18969d2ac8ead75e8808def17244225ec047a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.4/hpp_0.2.4_linux_amd64.tar.gz'
      sha256 'fb8d9f4016aab6185f7bde09d86682976bb23b64a79e821306828542b4253f20'
    end
  end

  head do
    url 'https://github.com/jackchuka/hpp.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'hpp'
  end
end
