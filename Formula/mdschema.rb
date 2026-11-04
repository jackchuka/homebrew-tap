class Mdschema < Formula
  desc 'A declarative schema-based Markdown validator that helps maintain consistent documentation structure across projects.'
  version '0.15.7'
  homepage 'https://github.com/jackchuka/mdschema'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.15.7/mdschema_0.15.7_darwin_arm64.tar.gz'
      sha256 '9b2cdcc0626c63cce6629972402799f82b6f7715674b4b99d6ddbc3125725214'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.15.7/mdschema_0.15.7_darwin_amd64.tar.gz'
      sha256 'e07709bc274faa41bb10702ca8a1a1304d39875b7ceb3584ac44a26ab21f7a3c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.15.7/mdschema_0.15.7_linux_arm64.tar.gz'
      sha256 'e593a5ca68f90e69bb78733d646fa4be82b2a25e1779e5761b14548c769bff72'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.15.7/mdschema_0.15.7_linux_amd64.tar.gz'
      sha256 '695d5206aa66963e5bb9ffb6dd591cfee1b95892ae872d9b9172697b93e4554a'
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
