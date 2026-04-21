class Tfpacker < Formula
  desc '🧩 A Terraform file packer that organizes resource, module, data, and variable blocks into clean, rule-based .tf files. 💡 Supports custom grouping by type, name prefix, or both — with optional YAML config.'
  version '0.2.5'
  homepage 'https://github.com/jackchuka/tfpacker'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.5/tfpacker_0.2.5_darwin_arm64.tar.gz'
      sha256 'a7d4cc279f459770437ad250b777d791f08c9b69049b1fcb3374d92ea17d6872'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.5/tfpacker_0.2.5_darwin_amd64.tar.gz'
      sha256 'e52f58f69b94febe614be5d05420e5d464e11c91ac2fc4b55e70639bbf77e149'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.5/tfpacker_0.2.5_linux_arm64.tar.gz'
      sha256 'ea860f2ee84f975a280f4e220c9e412db08a2ba56eaab59a761eab622f162c7e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.5/tfpacker_0.2.5_linux_amd64.tar.gz'
      sha256 'b07203d24dfb76666428005bda114d1ef7287a8356358baffce17214301aa414'
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
