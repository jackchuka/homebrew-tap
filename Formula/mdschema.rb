class Mdschema < Formula
  desc '📝 A declarative schema-based Markdown validator that helps maintain consistent documentation structure across projects.'
  version '0.5.0'
  homepage 'https://github.com/jackchuka/mdschema'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.5.0/mdschema_0.5.0_darwin_arm64.tar.gz'
      sha256 'c11cc536ce5454701f34f53a021d32a0452f92c512847c53f36d81f5d28c8ccc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.5.0/mdschema_0.5.0_darwin_amd64.tar.gz'
      sha256 '41536311dec02f6544b304f63315b2a7f2444bfdeee95e6861257d67340cd1b5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.5.0/mdschema_0.5.0_linux_arm64.tar.gz'
      sha256 '40e5be3b9e60e4a2998cfc25f54fc30bdb9cfecd7e7002ad810b2d6ed598c317'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.5.0/mdschema_0.5.0_linux_amd64.tar.gz'
      sha256 '6293078692fc1accab322ae62ef91eaf443408bc5c3c54aba57b6b94862d0e15'
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
