class Gv < Formula
  desc 'Git Vision - monitor multiple git repositories'
  version '0.1.11'
  homepage 'https://github.com/jackchuka/gv'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.11/gv_0.1.11_darwin_arm64.tar.gz'
      sha256 '658debc4518243d4d7a1a43788d39dd4880a30d6762db9733ea9dc7311909cb3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.11/gv_0.1.11_darwin_amd64.tar.gz'
      sha256 '55f1d52ce3f46339fbcbcd6eae13cb15835b22388d4538fa887da8b064888177'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.11/gv_0.1.11_linux_arm64.tar.gz'
      sha256 '12d7cd43aad19b7713cbe03f13094650525aac43beac1259be2457f45853e06d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.11/gv_0.1.11_linux_amd64.tar.gz'
      sha256 'fddd9d96544a0ff5c703773b8b063fa3cb6a05f8ede9c190fbef180c2c9e1aa4'
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
