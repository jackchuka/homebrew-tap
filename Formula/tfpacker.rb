class Tfpacker < Formula
  desc 'Organize Terraform resource, module, data, and variable blocks into clean, rule-based .tf files. Group by type, name prefix, or both, with optional YAML config.'
  version '0.2.14'
  homepage 'https://github.com/jackchuka/tfpacker'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.14/tfpacker_0.2.14_darwin_arm64.tar.gz'
      sha256 '03040c4c4214641ba42bf19b49de828d1288ab318e034f27c4c871e9e2d8ef52'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.14/tfpacker_0.2.14_darwin_amd64.tar.gz'
      sha256 '88c6f5d10f194d3443f7d893f1940ed34742f41b2a52f3792679f9d4eea73184'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.14/tfpacker_0.2.14_linux_arm64.tar.gz'
      sha256 '910d546cc56cb3fc23f88a33a08b5c542974871ee37c6c76d5283e548614f9c5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.14/tfpacker_0.2.14_linux_amd64.tar.gz'
      sha256 '9abad1e2b51de710d8126dd8564d96b667458907aad3c336011821918b5256bd'
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
