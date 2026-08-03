class Mdschema < Formula
  desc '📝 A declarative schema-based Markdown validator that helps maintain consistent documentation structure across projects.'
  version '0.15.0'
  homepage 'https://github.com/jackchuka/mdschema'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.15.0/mdschema_0.15.0_darwin_arm64.tar.gz'
      sha256 '737a7aaba100007ae3b7b203d9debf74403e4f77c43771a23c615bfde1337f03'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.15.0/mdschema_0.15.0_darwin_amd64.tar.gz'
      sha256 '2394fa5a929e1ddcf0003c3dfd5787a1df10d65a49c7c90cb371e72ba993e82c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.15.0/mdschema_0.15.0_linux_arm64.tar.gz'
      sha256 '1e122900dfacfee7d3d642b0337b9973c36c383a929e1891046b8fd8530dec1c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.15.0/mdschema_0.15.0_linux_amd64.tar.gz'
      sha256 '242dbb80da936f18494a6763bd92d0dd56df654535de0fb8e510a38f30453d10'
    end
  end

  head do
    url 'https://github.com/jackchuka/mdschema.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'mdschema'
  end
end
