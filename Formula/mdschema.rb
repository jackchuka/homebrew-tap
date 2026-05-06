class Mdschema < Formula
  desc '📝 A declarative schema-based Markdown validator that helps maintain consistent documentation structure across projects.'
  version '0.13.0'
  homepage 'https://github.com/jackchuka/mdschema'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.13.0/mdschema_0.13.0_darwin_arm64.tar.gz'
      sha256 '19c787e44e5daa32a9e4504c38583d24f7233d596e4757235d86796f00e6f85b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.13.0/mdschema_0.13.0_darwin_amd64.tar.gz'
      sha256 'd4e3057e92b75d66e97ed7dc0ba40a91bed3479b5574ce8267c1aabbc0ccdbd6'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.13.0/mdschema_0.13.0_linux_arm64.tar.gz'
      sha256 '2ef8259940f60580c11e344e7bf6d4733b4020d52f5419346bedcfdc67f8b7cb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.13.0/mdschema_0.13.0_linux_amd64.tar.gz'
      sha256 'ee525db2b95d2053c70c4fce621c95eb2e1085b90bd4f6f29d5a757f7ad44b07'
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
