class Tfpacker < Formula
  desc '🧩 A Terraform file packer that organizes resource, module, data, and variable blocks into clean, rule-based .tf files. 💡 Supports custom grouping by type, name prefix, or both — with optional YAML config.'
  version '0.2.4'
  homepage 'https://github.com/jackchuka/tfpacker'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.4/tfpacker_0.2.4_darwin_arm64.tar.gz'
      sha256 '91c3237c769fd2f5ed09112a34f2b29fe8cadc5aec713a42e9d3164041cd4d01'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.4/tfpacker_0.2.4_darwin_amd64.tar.gz'
      sha256 '7182956c8f24c21585836202352e04efc5e688c9e736f109353b204e43c6fb3a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.4/tfpacker_0.2.4_linux_arm64.tar.gz'
      sha256 'a0eee01a0df77396ea24e167799d46b614495e418304d4c3b7de96dd63dc30be'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.4/tfpacker_0.2.4_linux_amd64.tar.gz'
      sha256 '4bb54e87ff6562fa1e5131fd0479f5113732176081b35c652ebbd0cd08947f5f'
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
