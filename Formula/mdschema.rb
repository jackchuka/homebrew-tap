class Mdschema < Formula
  desc '📝 A declarative schema-based Markdown validator that helps maintain consistent documentation structure across projects.'
  version '0.11.2'
  homepage 'https://github.com/jackchuka/mdschema'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.11.2/mdschema_0.11.2_darwin_arm64.tar.gz'
      sha256 '4f19b15da0a6671fd15149a75d85526d024e3c88ea276fdafaff728fa74dfec4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.11.2/mdschema_0.11.2_darwin_amd64.tar.gz'
      sha256 '72312d2335c4578767c63209295b98f8d7cb91f197299af791db15933a1a043f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.11.2/mdschema_0.11.2_linux_arm64.tar.gz'
      sha256 '64eb4a84f7fe32f09b3386911f19a8b3cbf4efee222c1875cb90b069882ff58f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.11.2/mdschema_0.11.2_linux_amd64.tar.gz'
      sha256 'f6b8d38eb96c849d87d298de6e665c032c9ee9982cc8d7c538cae63123b11e04'
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
