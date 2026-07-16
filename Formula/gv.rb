class Gv < Formula
  desc 'Git Vision - monitor multiple git repositories'
  version '0.1.10'
  homepage 'https://github.com/jackchuka/gv'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.10/gv_0.1.10_darwin_arm64.tar.gz'
      sha256 '8813420b8cf309306c39fa60b6b58c819553727087d58e869c850cd2a79e7bea'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.10/gv_0.1.10_darwin_amd64.tar.gz'
      sha256 '2492ac2b2f2e4a87dc3cb969b1acae514c46b0774a8172c78461357ecd65f8cd'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.10/gv_0.1.10_linux_arm64.tar.gz'
      sha256 'd3da0b2477555d588bf601e17c471c649c8b5d8247d7ef2a534748eeb42d10d1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.10/gv_0.1.10_linux_amd64.tar.gz'
      sha256 '54c91f6c40aea28342b089cfe53da030d7eb21678c830e410bf5056eeb55d5e9'
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
