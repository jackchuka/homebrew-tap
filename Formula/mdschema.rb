class Mdschema < Formula
  desc '📝 A declarative schema-based Markdown validator that helps maintain consistent documentation structure across projects.'
  version '0.9.1'
  homepage 'https://github.com/jackchuka/mdschema'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.9.1/mdschema_0.9.1_darwin_arm64.tar.gz'
      sha256 'e5b4478830697280815a0ff60d44e1a1c526cac4d707ed6262ca05b7cb69439c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.9.1/mdschema_0.9.1_darwin_amd64.tar.gz'
      sha256 '2977dd8026616ead79642cdd52ad5893bf5b563376582eb4b967c2ba83cd4353'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.9.1/mdschema_0.9.1_linux_arm64.tar.gz'
      sha256 'd41fb997b0ddf4a636a5060881bc4c12949f0aebd6666d4e4852019e6829ad3e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.9.1/mdschema_0.9.1_linux_amd64.tar.gz'
      sha256 '038bbe0c8f7d3dad2b4e2e73f844568b76c3f68f9af4219ead7ec553f222f742'
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
