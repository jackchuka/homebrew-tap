class Gv < Formula
  desc 'Git Vision - monitor multiple git repositories'
  version '0.1.9'
  homepage 'https://github.com/jackchuka/gv'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.9/gv_0.1.9_darwin_arm64.tar.gz'
      sha256 '7f61d7bda33213739ccd3c4e44bccc38bfdb86217d258b5f9eead572531ceb7e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.9/gv_0.1.9_darwin_amd64.tar.gz'
      sha256 'd4ee8a5462e1613527c422e7f845d4687dbd355f5d41f2751e8353e89849051e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.9/gv_0.1.9_linux_arm64.tar.gz'
      sha256 'f0912a12b2aa8813a3077ef8c25ec36ea85e47210b617b22914df95c97cfef77'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.9/gv_0.1.9_linux_amd64.tar.gz'
      sha256 '5c90b97abfe7e0f126f652aa69366234ae2799fed67e2776c213e6b012aef0cb'
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
