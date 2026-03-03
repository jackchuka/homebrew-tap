class Mdschema < Formula
  desc '📝 A declarative schema-based Markdown validator that helps maintain consistent documentation structure across projects.'
  version '0.12.4'
  homepage 'https://github.com/jackchuka/mdschema'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.12.4/mdschema_0.12.4_darwin_arm64.tar.gz'
      sha256 'c20c54d399c9b95afe897aaaf58ed52f53e7df18c678eca1958730f4cffd65bb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.12.4/mdschema_0.12.4_darwin_amd64.tar.gz'
      sha256 '51257c12e98c7c97a2f765a6a1019293f6ca53d32eeefbf3624a72d5eb843049'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.12.4/mdschema_0.12.4_linux_arm64.tar.gz'
      sha256 '3e6406b69eed7c87292fc064a3306311427b78f9c2e9b2d49a43cdf257a66278'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.12.4/mdschema_0.12.4_linux_amd64.tar.gz'
      sha256 '67d7c88676c04a240ee2794e2673f944529f8b341d538c094a3e4e5f225b4301'
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
