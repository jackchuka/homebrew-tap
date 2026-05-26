class Hpp < Formula
  desc 'CLI tool for searching Japanese restaurants using the HotPepper Gourmet API'
  version '0.2.5'
  homepage 'https://github.com/jackchuka/hpp'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.5/hpp_0.2.5_darwin_arm64.tar.gz'
      sha256 '664305ec3385bd091579acb5772f8f429a1fe3415009745139d420f9fb54cb01'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.5/hpp_0.2.5_darwin_amd64.tar.gz'
      sha256 '49bdeac4dbc4607cfda2e1a7bf6eaf128598607c692effd60267dae25ce884b9'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.5/hpp_0.2.5_linux_arm64.tar.gz'
      sha256 '556985f708174c91183bb4398c4ba4d49e47dde6cdd286aa777298a17a23a89b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/hpp/releases/download/v0.2.5/hpp_0.2.5_linux_amd64.tar.gz'
      sha256 '8613b22cc212a2e1af474bf43accd242cf4f51c17544ab655348e8118775aa0d'
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
