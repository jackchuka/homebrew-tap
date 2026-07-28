class Tfpacker < Formula
  desc '🧩 A Terraform file packer that organizes resource, module, data, and variable blocks into clean, rule-based .tf files. 💡 Supports custom grouping by type, name prefix, or both — with optional YAML config.'
  version '0.2.12'
  homepage 'https://github.com/jackchuka/tfpacker'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.12/tfpacker_0.2.12_darwin_arm64.tar.gz'
      sha256 '45e8cd06753f8573c28186d273e8be91557450951681e907355dfa2b4fc1a93d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.12/tfpacker_0.2.12_darwin_amd64.tar.gz'
      sha256 '07249e67f1b2a7134cd1c07927c7d3cfb80a1c74feddfb2ea866865432686b80'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.12/tfpacker_0.2.12_linux_arm64.tar.gz'
      sha256 '10f2e8278c6f77d647d47cbcb2a9d4939bd10056f899bdbbe5bbd59d6bd2ebe6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.12/tfpacker_0.2.12_linux_amd64.tar.gz'
      sha256 'd78de7339758a201bb2c5431bf5ece117d08bf0dd69e3763268930af6e483cc0'
    end
  end

  head do
    url 'https://github.com/jackchuka/tfpacker.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tfpacker'
  end
end
