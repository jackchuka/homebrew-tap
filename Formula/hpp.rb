class Hpp < Formula
  desc 'CLI tool for searching Japanese restaurants using the HotPepper Gourmet API'
  version '0.2.0'
  homepage 'https://github.com/jackchuka/hpp'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.0/hpp_0.2.0_darwin_arm64.tar.gz'
      sha256 '0ff7754b2724eac9eec2fa9a019f6c966b60e0d6baf7674d87177918a3b69f85'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.0/hpp_0.2.0_darwin_amd64.tar.gz'
      sha256 '26917e14be7af72b62b5a60ac2a01f610a1a1d6c5fd77ad25c6468892f54805c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.0/hpp_0.2.0_linux_arm64.tar.gz'
      sha256 '026dcd4b94afafbe9c52042dcb916c553837fe5babdefa923b46bb3c79fa4c8c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.0/hpp_0.2.0_linux_amd64.tar.gz'
      sha256 '81e11f3a77d467ea25559f811c2cdb5b67ed602ef5ebbb6bcc3ac00d2321279f'
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
