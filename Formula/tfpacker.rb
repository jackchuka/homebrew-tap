class Tfpacker < Formula
  desc '🧩 A Terraform file packer that organizes resource, module, data, and variable blocks into clean, rule-based .tf files. 💡 Supports custom grouping by type, name prefix, or both — with optional YAML config.'
  version '0.2.3'
  homepage 'https://github.com/jackchuka/tfpacker'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.3/tfpacker_0.2.3_darwin_arm64.tar.gz'
      sha256 '7d4af81f99d3b47aee1ff42182d90412525fe802db8fbc98a918e67da20e903e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.3/tfpacker_0.2.3_darwin_amd64.tar.gz'
      sha256 '9aa48ee858fba3a0b70bb804a18304b07179724d15d57d6dd8d2f3283427b41e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.3/tfpacker_0.2.3_linux_arm64.tar.gz'
      sha256 '3d1e5a4d661b72ca0695e3fcb0b8fbf364d5b7e3c9387a0125e97f6236ccb511'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.3/tfpacker_0.2.3_linux_amd64.tar.gz'
      sha256 '06b0369ff35cf1fa04f8d33d2a3ff4ea2c1c4596de9f54bddf97a0ed83dcbcf4'
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
