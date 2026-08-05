class Mdschema < Formula
  desc '📝 A declarative schema-based Markdown validator that helps maintain consistent documentation structure across projects.'
  version '0.15.1'
  homepage 'https://github.com/jackchuka/mdschema'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.15.1/mdschema_0.15.1_darwin_arm64.tar.gz'
      sha256 '1a150979f42f3d8b0a37388d1d24f85ff9fd7db5c253aa567516fd92a2e805f0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.15.1/mdschema_0.15.1_darwin_amd64.tar.gz'
      sha256 '3a365906d5335442ebc5a167f016a74ea07f34befe10bffffdb5a28990c5e2a8'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.15.1/mdschema_0.15.1_linux_arm64.tar.gz'
      sha256 '939c1d4fd3e5a553e2095fc404a30db980a92ea8db741be93666bb343eb8bd15'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.15.1/mdschema_0.15.1_linux_amd64.tar.gz'
      sha256 '94a150893b0a0852e234f2e349dd19af4ede1b1f43f5e486e2d069e0cc7e605b'
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
