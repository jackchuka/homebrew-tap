class Goalias < Formula
  desc 'Instantly standardize Go import aliases across your entire codebase with LSP-powered precision.'
  version '1.0.4'
  homepage 'https://github.com/jackchuka/goalias'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.4/goalias_1.0.4_darwin_arm64.tar.gz'
      sha256 '1b516fde36969c5aa99bfa7bc55bf1761eaa8d54e0e9d85e9e8bd042db132367'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.4/goalias_1.0.4_darwin_amd64.tar.gz'
      sha256 '4de5fdd29339587f8484d289d0aafa81de7ec07e0c9be6c12ea8f01a62d092b8'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.4/goalias_1.0.4_linux_arm64.tar.gz'
      sha256 '48a5457fc59aa58170af6fea0980b7cf1d1593d0297ca47930d67a9b7bed7b6f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.4/goalias_1.0.4_linux_amd64.tar.gz'
      sha256 '2e1e5cc6f3d7a11e14774e7649e3f59a8877e2bf7f3bf7c1e086522e9fa6afbd'
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
