class Mdschema < Formula
  desc '📝 A declarative schema-based Markdown validator that helps maintain consistent documentation structure across projects.'
  version '0.15.3'
  homepage 'https://github.com/jackchuka/mdschema'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.15.3/mdschema_0.15.3_darwin_arm64.tar.gz'
      sha256 '40fdacd75d6c254af326dc7eb060c32319129bf20af3855444f35f5ef2a1cc07'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.15.3/mdschema_0.15.3_darwin_amd64.tar.gz'
      sha256 'e0fa13cbd1f38a4db72dc705a47880e5177ccbf1980a04796a3211f77da6d7a9'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.15.3/mdschema_0.15.3_linux_arm64.tar.gz'
      sha256 '4221e8fbaab31b609c99d62aedaf9007a113ce3320e47e5774021e0b856594ec'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.15.3/mdschema_0.15.3_linux_amd64.tar.gz'
      sha256 'ab6ada2b546cd177c9c067a2199b528a8e119c5492a87692acf6e8b4e1ca15a7'
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
