class Tfpacker < Formula
  desc '🧩 A Terraform file packer that organizes resource, module, data, and variable blocks into clean, rule-based .tf files. 💡 Supports custom grouping by type, name prefix, or both — with optional YAML config.'
  version '0.2.6'
  homepage 'https://github.com/jackchuka/tfpacker'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.6/tfpacker_0.2.6_darwin_arm64.tar.gz'
      sha256 'e0f61135473f48d2ea73817f16aec084e051c5065060e12fa39f3b0c44741593'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.6/tfpacker_0.2.6_darwin_amd64.tar.gz'
      sha256 '81f7e54aa24b2d30443941194424e0ff4cbd088d219745d1559c2ae8edeca0db'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.6/tfpacker_0.2.6_linux_arm64.tar.gz'
      sha256 'b012eb98a4c904c8a18325190c44538f0a2665ee7e8dd5606cce913364c4932e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.6/tfpacker_0.2.6_linux_amd64.tar.gz'
      sha256 'bfe03cdb4e34181ea600159e326f9db48e093c16348d2c5ffb34421cf2e2c8a2'
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
