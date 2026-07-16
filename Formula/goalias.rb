class Goalias < Formula
  desc 'Instantly standardize Go import aliases across your entire codebase with LSP-powered precision.'
  version '1.0.12'
  homepage 'https://github.com/jackchuka/goalias'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.12/goalias_1.0.12_darwin_arm64.tar.gz'
      sha256 'd5070be87a0fd11367f7e84fb79bbe2ac5dace47472d5ea83298aac5f4c2cd88'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.12/goalias_1.0.12_darwin_amd64.tar.gz'
      sha256 '1c8799b2a4cfc522502320797e53a17b591c30ec2f573a021119a49346897960'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.12/goalias_1.0.12_linux_arm64.tar.gz'
      sha256 '68a4becb3581c8f089784bfb26913af6dbde9fcb20fee5eb5e93cd44fda63baf'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.12/goalias_1.0.12_linux_amd64.tar.gz'
      sha256 '718c85720f924b7d57c8bb70b800fe4d066d9cbb732aa1060e1977e574ce8fc6'
    end
  end

  head do
    url 'https://github.com/jackchuka/goalias.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'goalias'
  end
end
