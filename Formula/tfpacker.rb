class Tfpacker < Formula
  desc '🧩 A Terraform file packer that organizes resource, module, data, and variable blocks into clean, rule-based .tf files. 💡 Supports custom grouping by type, name prefix, or both — with optional YAML config.'
  version '0.2.7'
  homepage 'https://github.com/jackchuka/tfpacker'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.7/tfpacker_0.2.7_darwin_arm64.tar.gz'
      sha256 '054be9eaf09519630060c0efe25cce4a420a41e2a29227e4b090fb3ffaf90226'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.7/tfpacker_0.2.7_darwin_amd64.tar.gz'
      sha256 'ffe0edc61aa070db4e940b026deb6388d49ca5c75548f32f9e3629eb1161d78a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.7/tfpacker_0.2.7_linux_arm64.tar.gz'
      sha256 '6d465c6c7aa6cbd81b8b5fa82717e20939a3281f815cf9a4eab87ce1b657b5f7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.7/tfpacker_0.2.7_linux_amd64.tar.gz'
      sha256 '7dacd744d831d78951215f43adfa6e7b532808059c4065eae7a97d4004ea9e80'
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
