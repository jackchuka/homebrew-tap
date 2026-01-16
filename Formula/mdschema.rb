class Mdschema < Formula
  desc '📝 A declarative schema-based Markdown validator that helps maintain consistent documentation structure across projects.'
  version '0.4.0'
  homepage 'https://github.com/jackchuka/mdschema'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.4.0/mdschema_0.4.0_darwin_arm64.tar.gz'
      sha256 '1da286a128f930ce42a4b1409ae1c2a9b015a21ea5d6d51bb4ba75ac3c330ee2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.4.0/mdschema_0.4.0_darwin_amd64.tar.gz'
      sha256 'f7bcc3bfaf74b54511b65a18cf7d7fdbc69b7ee6d36121786886bf5c383a5f9f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.4.0/mdschema_0.4.0_linux_arm64.tar.gz'
      sha256 '230dd50ef9901835b5cdc9d3c6901c55ec98a0ebd3d0673a520380f6b6fb88bf'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.4.0/mdschema_0.4.0_linux_amd64.tar.gz'
      sha256 '3a62f6c7ac32763f85b07cca251054ecd94da25dc700a0219b06a3a56f49008d'
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
