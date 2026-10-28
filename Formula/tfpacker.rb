class Tfpacker < Formula
  desc 'Organize Terraform resource, module, data, and variable blocks into clean, rule-based .tf files. Group by type, name prefix, or both, with optional YAML config.'
  version '0.2.15'
  homepage 'https://github.com/jackchuka/tfpacker'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.15/tfpacker_0.2.15_darwin_arm64.tar.gz'
      sha256 '8fcf041cef3700d1dd8fbf5295d98cae0492eb3f29573c3a6e9d1c12c1627575'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.15/tfpacker_0.2.15_darwin_amd64.tar.gz'
      sha256 '6c56b7acf730ab3858c79f283b7a8e6c17e1b3fb064ecc6ade5c825659ca5738'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.15/tfpacker_0.2.15_linux_arm64.tar.gz'
      sha256 '6460393262497b7c356f4b1831f98d1c4b41e9ea4def430a223e277d33700b9b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.15/tfpacker_0.2.15_linux_amd64.tar.gz'
      sha256 '9832e0df5374a4d0ae8895dc5d68fd37ec0bffb9ed8002a461621bf217cb7a10'
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
