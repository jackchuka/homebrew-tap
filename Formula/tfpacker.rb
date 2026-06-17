class Tfpacker < Formula
  desc '🧩 A Terraform file packer that organizes resource, module, data, and variable blocks into clean, rule-based .tf files. 💡 Supports custom grouping by type, name prefix, or both — with optional YAML config.'
  version '0.2.8'
  homepage 'https://github.com/jackchuka/tfpacker'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.8/tfpacker_0.2.8_darwin_arm64.tar.gz'
      sha256 '312b2216e315e19f5323b61008ba0672c6ab4d07ad1b7a56ff72cd1e04a5f104'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.8/tfpacker_0.2.8_darwin_amd64.tar.gz'
      sha256 'b7dea8a77550a1631f90dd8e45f96f6b89a04af5adc70b7be35e44cd7ecafa5a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.8/tfpacker_0.2.8_linux_arm64.tar.gz'
      sha256 '609341761ee7bdd7866a9bdb47b6358272f5ffcba56a90b9b7d7655c55e03a79'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.8/tfpacker_0.2.8_linux_amd64.tar.gz'
      sha256 '72f8cf953dcfa7daaacbe4080329468fb2d45d73cf76019b78feb08631e629a5'
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
