class Mdschema < Formula
  desc '📝 A declarative schema-based Markdown validator that helps maintain consistent documentation structure across projects.'
  version '0.13.4'
  homepage 'https://github.com/jackchuka/mdschema'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.13.4/mdschema_0.13.4_darwin_arm64.tar.gz'
      sha256 '80c4da5c2d5c237c2bcf0db4cb01d68b805cfcfdea02ab528e9ecd332d9238fb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.13.4/mdschema_0.13.4_darwin_amd64.tar.gz'
      sha256 '656f2cc6e0d59f06cccc3fa7a1f257e629da2e1ac7e8105bfe2fa5ec48847727'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.13.4/mdschema_0.13.4_linux_arm64.tar.gz'
      sha256 '9e673142109f967caed85753d95fde764b0b9872dd9fc9182596a04838a36180'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.13.4/mdschema_0.13.4_linux_amd64.tar.gz'
      sha256 'b4d86b3c273172aca0380f6c3e5a23f731cfc5576633b467f6c5f923e48180e3'
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
