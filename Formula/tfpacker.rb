class Tfpacker < Formula
  desc '🧩 A Terraform file packer that organizes resource, module, data, and variable blocks into clean, rule-based .tf files. 💡 Supports custom grouping by type, name prefix, or both — with optional YAML config.'
  version '0.2.2'
  homepage 'https://github.com/jackchuka/tfpacker'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.2/tfpacker_0.2.2_darwin_arm64.tar.gz'
      sha256 'c8ebbbe92aa20d7d9c12bc45337715337c33404cc18f941e51de810da2fc683d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.2/tfpacker_0.2.2_darwin_amd64.tar.gz'
      sha256 '54a0ab808522a6b1c3f5591f74ce6fe1c20bc4863f1b9f4444f14780b4427813'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.2/tfpacker_0.2.2_linux_arm64.tar.gz'
      sha256 'e5684012a01c67f691697d1e7afcf51360f1a8c2990d22024966fac23f09132b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.2/tfpacker_0.2.2_linux_amd64.tar.gz'
      sha256 '4141186330d95c017f93e83bb4b3930addb777d59038affea07f81465d3c6d33'
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
