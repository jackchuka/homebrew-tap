class Gv < Formula
  desc 'Git Vision - monitor multiple git repositories'
  version '0.1.12'
  homepage 'https://github.com/jackchuka/gv'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.12/gv_0.1.12_darwin_arm64.tar.gz'
      sha256 'ad510504cc1c091df9774a90c0a430eec18b509f5f6dd594a2676da4d7a32657'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.12/gv_0.1.12_darwin_amd64.tar.gz'
      sha256 'b9579944c7ffc3223787aacf91f3bfed7b4a110b9c1bd599d0cb2f8c1a3cf6f3'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.12/gv_0.1.12_linux_arm64.tar.gz'
      sha256 'd62b561499761b9f9e0d92aceba16003094027be93d59ffbe54668d64d36e997'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/gv/releases/download/v0.1.12/gv_0.1.12_linux_amd64.tar.gz'
      sha256 '47aab66d3f08e3e782e81b0e1e7b362320081c488fba73ceffd308c71bb9be6b'
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
