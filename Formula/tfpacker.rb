class Tfpacker < Formula
  desc '🧩 A Terraform file packer that organizes resource, module, data, and variable blocks into clean, rule-based .tf files. 💡 Supports custom grouping by type, name prefix, or both — with optional YAML config.'
  version '0.2.1'
  homepage 'https://github.com/jackchuka/tfpacker'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.1/tfpacker_0.2.1_darwin_arm64.tar.gz'
      sha256 '0fd7483d17c85d9de99b65891b53be0480130022824ef3b2d6b52302490f335d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.1/tfpacker_0.2.1_darwin_amd64.tar.gz'
      sha256 'aa066b831ea9e86b35405b20cfc53cd51a6c8aee4c36e798755d42a3a3467c59'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.1/tfpacker_0.2.1_linux_arm64.tar.gz'
      sha256 '1f10e065a6a93f4cf0084b5dfc1c9e0681adbae50bf7a45c757d0bac2fda7aed'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.1/tfpacker_0.2.1_linux_amd64.tar.gz'
      sha256 '95747a8c4ba801d0a331c3023f86787ff19b37897708f5ba304d7fb73d41b44b'
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
