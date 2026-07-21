class Tfpacker < Formula
  desc '🧩 A Terraform file packer that organizes resource, module, data, and variable blocks into clean, rule-based .tf files. 💡 Supports custom grouping by type, name prefix, or both — with optional YAML config.'
  version '0.2.11'
  homepage 'https://github.com/jackchuka/tfpacker'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.11/tfpacker_0.2.11_darwin_arm64.tar.gz'
      sha256 'dee73ebe66a2a3ca235c48abe6b431653ca8d7e1c25dcf04a3ccaf7db541660a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.11/tfpacker_0.2.11_darwin_amd64.tar.gz'
      sha256 '56e7d29e8a7da47d79be454839746899417aaf09978f5c71fc5a579d636fb6e6'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.11/tfpacker_0.2.11_linux_arm64.tar.gz'
      sha256 'deebed2e8f26f9c46d42d2a5298691d634030f327cd994683f931d1e95f9cfce'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.11/tfpacker_0.2.11_linux_amd64.tar.gz'
      sha256 '4cb992dfa5e8e4a760d1797cb2e5d59fb01130ff4640870be2788113c0a56af6'
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
