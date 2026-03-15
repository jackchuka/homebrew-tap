class Hpp < Formula
  desc 'CLI tool for searching Japanese restaurants using the HotPepper Gourmet API'
  version '0.2.1'
  homepage 'https://github.com/jackchuka/hpp'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.1/hpp_0.2.1_darwin_arm64.tar.gz'
      sha256 '8bf82a72b75195cc738713d5ddd4b028f9fa9bbfb3b06856a36d66efc31a2506'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.1/hpp_0.2.1_darwin_amd64.tar.gz'
      sha256 'd3837e79b06f564ca06fd4d9c5b388ace799f169091d2e491cdcc7166884a2d6'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.1/hpp_0.2.1_linux_arm64.tar.gz'
      sha256 '24889cc3fb94b11a6b5200f71077e88bf320ff0d7d37aaca8fbf76a8268257ac'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.1/hpp_0.2.1_linux_amd64.tar.gz'
      sha256 '3031f30ff54a11d7bf2af4053a35b1d9342e96addfe1d38baf44a292a8a62c2b'
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
