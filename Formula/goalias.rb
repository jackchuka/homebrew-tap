class Goalias < Formula
  desc 'Instantly standardize Go import aliases across your entire codebase with LSP-powered precision.'
  version '1.0.5'
  homepage 'https://github.com/jackchuka/goalias'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.5/goalias_1.0.5_darwin_arm64.tar.gz'
      sha256 'af07a89e33078b5ccdfb7041b59b744f92026170a3f476ea77457039bd637aff'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.5/goalias_1.0.5_darwin_amd64.tar.gz'
      sha256 '0d39b78862ebad89d3419b3ba418488d80cf4d51024d84e15abcc1ebaf2f7160'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.5/goalias_1.0.5_linux_arm64.tar.gz'
      sha256 '9aac5be3e2524983400474823c72267cd5f277d24e4416a2851166409230bd97'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.5/goalias_1.0.5_linux_amd64.tar.gz'
      sha256 'bbdb906abf64c62d3295e97406a0cbb67825f6e3a6b3739157234b3c98b5ff53'
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
