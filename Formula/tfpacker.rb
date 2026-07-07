class Tfpacker < Formula
  desc '🧩 A Terraform file packer that organizes resource, module, data, and variable blocks into clean, rule-based .tf files. 💡 Supports custom grouping by type, name prefix, or both — with optional YAML config.'
  version '0.2.9'
  homepage 'https://github.com/jackchuka/tfpacker'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.9/tfpacker_0.2.9_darwin_arm64.tar.gz'
      sha256 '5c36b34417cc1d4c347c7f216137a618f63b1bd1727d48510308335efda0a7f3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.9/tfpacker_0.2.9_darwin_amd64.tar.gz'
      sha256 '20e81cf9667f75332cef544f1c4299ee5be1924a424a9a9897651d8a37cf3f94'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.9/tfpacker_0.2.9_linux_arm64.tar.gz'
      sha256 'e4f93507bd9a97285f72ed58875ab0eb16610b9b2040c6f7cad920a13ac6a513'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.9/tfpacker_0.2.9_linux_amd64.tar.gz'
      sha256 '847cc5bfc0564ff5f4a13de5faf1f62b185a2b48b5ce0dedd6c42121f16e214f'
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
