class Mdschema < Formula
  desc '📝 A declarative schema-based Markdown validator that helps maintain consistent documentation structure across projects.'
  version '0.12.8'
  homepage 'https://github.com/jackchuka/mdschema'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.12.8/mdschema_0.12.8_darwin_arm64.tar.gz'
      sha256 '4e6c1b161dcfd14d0d02dd9794e5df139e69800b159e35bbeae72bc9b7b21a16'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.12.8/mdschema_0.12.8_darwin_amd64.tar.gz'
      sha256 '2fb9999a5d147581236fe4ac1595f7dabd20e5ee1b69e918a1c921b97be24427'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.12.8/mdschema_0.12.8_linux_arm64.tar.gz'
      sha256 'c18a6c9a6951b6f18dc101c3a2ba3102d76156d9f5f3a9def6a0d1522d0c49b5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.12.8/mdschema_0.12.8_linux_amd64.tar.gz'
      sha256 'fe1acf413282f88dd473138991b120ae8ba40eff21f1af51c6fe41cb181784bf'
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
