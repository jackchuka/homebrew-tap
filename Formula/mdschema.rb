class Mdschema < Formula
  desc '📝 A declarative schema-based Markdown validator that helps maintain consistent documentation structure across projects.'
  version '0.12.6'
  homepage 'https://github.com/jackchuka/mdschema'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.12.6/mdschema_0.12.6_darwin_arm64.tar.gz'
      sha256 '0532b1e253e006b3c5fa40c33cc3c557a87fc6fd71412534699afed093dd2452'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.12.6/mdschema_0.12.6_darwin_amd64.tar.gz'
      sha256 '7252fa5946bd3d4c74ce65ec57a72f37bfaf2935736d4a3757d88337feba3bf5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.12.6/mdschema_0.12.6_linux_arm64.tar.gz'
      sha256 '59ada3facc4ce225dfe3d5bcf527e9ad95a4f00a9b8509956253dddc4341e262'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.12.6/mdschema_0.12.6_linux_amd64.tar.gz'
      sha256 'e290be5574e21f97fd260298d5f1982c807eb4bb1bd06f729993333fc9af75f8'
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
