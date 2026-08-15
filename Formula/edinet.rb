class Edinet < Formula
  desc 'A single-binary CLI for EDINET — search, download, and extract Japanese corporate filings from the FSA disclosure system'
  version '0.1.0'
  homepage 'https://github.com/jackchuka/edinet-cli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/edinet-cli/releases/download/v0.1.0/edinet_0.1.0_darwin_arm64.tar.gz'
      sha256 'ce8d72189ba8a5dc63bcb759be60982f3af99ed1407ba14f4fec871800b3d6dc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/edinet-cli/releases/download/v0.1.0/edinet_0.1.0_darwin_amd64.tar.gz'
      sha256 'aa33108fce7bbdd8e85206fbf8a92de345522cbcf7848d0b43666ee4ca7313e8'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/edinet-cli/releases/download/v0.1.0/edinet_0.1.0_linux_arm64.tar.gz'
      sha256 '62dab4c1a038e52d62ce525af6b38381033587e522d44b36b5b22082313cc18f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/edinet-cli/releases/download/v0.1.0/edinet_0.1.0_linux_amd64.tar.gz'
      sha256 'a9f39f811231bd18a061a33f4670b6258b51345b4261da7cf250020164d3e35e'
    end
  end

  head do
    url 'https://github.com/jackchuka/edinet-cli.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'go', 'build', '-o', 'edinet', './cmd/edinet'
    end
    bin.install 'edinet'
  end
end
