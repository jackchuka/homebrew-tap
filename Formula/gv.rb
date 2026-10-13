class Gv < Formula
  desc 'Git Vision - monitor multiple git repositories'
  version '0.1.14'
  homepage 'https://github.com/jackchuka/gv'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.14/gv_0.1.14_darwin_arm64.tar.gz'
      sha256 'ade306ce42ca01a19af8186cdd647d551d1844f332c310d425c0e95c846e8800'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.14/gv_0.1.14_darwin_amd64.tar.gz'
      sha256 '993313069206ae409e3a933380bcafcb5a5ccb0576c3c39048742075e2adfadd'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.14/gv_0.1.14_linux_arm64.tar.gz'
      sha256 '5a3374e4bcb4ebf682b4ec2167d053fa7ba60a36e229752df8414c28aa92b65a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.14/gv_0.1.14_linux_amd64.tar.gz'
      sha256 'ae9da49e95dc1c2b4d56a947fcadedf4ae756b48bd479ae2cb8aad67ca639a76'
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
