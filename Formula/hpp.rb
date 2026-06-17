class Hpp < Formula
  desc 'CLI tool for searching Japanese restaurants using the HotPepper Gourmet API'
  version '0.2.6'
  homepage 'https://github.com/jackchuka/hpp'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.6/hpp_0.2.6_darwin_arm64.tar.gz'
      sha256 '618e1735640a6b94cc86561933693950cdcb716c21828b3bc14268faca311d4f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.6/hpp_0.2.6_darwin_amd64.tar.gz'
      sha256 '1cde6702ee8ba25723fa663a15e84ed143da4a448d80c47848250dbd29a45ade'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.6/hpp_0.2.6_linux_arm64.tar.gz'
      sha256 '073508b7c49057aa45ad2967096795650c008421332869dcc7d12b84711c39d8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.6/hpp_0.2.6_linux_amd64.tar.gz'
      sha256 '210f02b5db8df89f066752172ac6bb71639a7e56b66e13ae9327490ff0620b7f'
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
