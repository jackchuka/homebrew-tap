class Goalias < Formula
  desc 'Instantly standardize Go import aliases across your entire codebase with LSP-powered precision.'
  version '1.0.14'
  homepage 'https://github.com/jackchuka/goalias'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.14/goalias_1.0.14_darwin_arm64.tar.gz'
      sha256 'a7a77ed21699abd4f659f98a7d783cc14972be7902d886ffde16140bb8748742'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.14/goalias_1.0.14_darwin_amd64.tar.gz'
      sha256 'ca9c7ba0b50ca954752cb94a11758d65783909c7b792e98dda6613a327e16bfd'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.14/goalias_1.0.14_linux_arm64.tar.gz'
      sha256 '3ad896466d10da0f2da7d9b41d4a6c3b442dfb670b34c5f9fc252715b666c6a4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.14/goalias_1.0.14_linux_amd64.tar.gz'
      sha256 '1b6ed313da6aa7244148421f8945297adafbfe977d693bc0552e693b8ce0c5bd'
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
