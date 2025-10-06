class Tfpacker < Formula
  desc '🧩 A Terraform file packer that organizes resource, module, data, and variable blocks into clean, rule-based .tf files. 💡 Supports custom grouping by type, name prefix, or both — with optional YAML config.'
  version '0.2.0'
  homepage 'https://github.com/jackchuka/tfpacker'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.0/tfpacker_0.2.0_darwin_arm64.tar.gz'
      sha256 '130c2b33d38009ee44593fcf2b4294868896d4b190f10ac17fcb3d0e9b6cc3b4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.0/tfpacker_0.2.0_darwin_amd64.tar.gz'
      sha256 '94e39c234fd97ed4227e7ad6c0986a7ebea1892d00ac750f7c203446a5566ddf'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.0/tfpacker_0.2.0_linux_arm64.tar.gz'
      sha256 '3cba4c5998cc758ad7aeb4748ff6c72167e95a27d235e60d2ad4229906e05829'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.0/tfpacker_0.2.0_linux_amd64.tar.gz'
      sha256 'db0f91827d9ffb7485fd78d044cb1672ad17e5a45f6aebea4c3d7d2ba8dc37d4'
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
