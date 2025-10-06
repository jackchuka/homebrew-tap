class Mdschema < Formula
  desc '📝 A declarative schema-based Markdown validator that helps maintain consistent documentation structure across projects.'
  version '0.2.0'
  homepage 'https://github.com/jackchuka/mdschema'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.2.0/mdschema_0.2.0_darwin_arm64.tar.gz'
      sha256 'ff8cdf9ecdace06e61cfefb020a229833744f66d130bc18d23eec71d8b80a40c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.2.0/mdschema_0.2.0_darwin_amd64.tar.gz'
      sha256 '87cf5de167e62800e64fd51efebbc7aff623fd28bb561b00b56d9cd7c257def6'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.2.0/mdschema_0.2.0_linux_arm64.tar.gz'
      sha256 '471166de60dda62d206b4ae4037f2e79349b900112e507dcc3ed963a29188747'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.2.0/mdschema_0.2.0_linux_amd64.tar.gz'
      sha256 '9cdc465b73e9b56ec56d3e3df93fd8ffd21738f26ac0ef824659d9b4c10ab8b6'
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
