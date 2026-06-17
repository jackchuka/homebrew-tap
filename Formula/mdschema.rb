class Mdschema < Formula
  desc '📝 A declarative schema-based Markdown validator that helps maintain consistent documentation structure across projects.'
  version '0.13.2'
  homepage 'https://github.com/jackchuka/mdschema'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.13.2/mdschema_0.13.2_darwin_arm64.tar.gz'
      sha256 '6383d3d13e183b054d8771a3c3a66b856896c5482af08ea2a82d382dda1249dd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.13.2/mdschema_0.13.2_darwin_amd64.tar.gz'
      sha256 'd2c1ed171dde257bf85b267723b6ca7bc34172c14fd6468ddc1282ce6c84a370'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.13.2/mdschema_0.13.2_linux_arm64.tar.gz'
      sha256 '6309de63aafdc57a611a3dd8d72e933c20e18ab02d0808f53d93ceaec3f0260a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.13.2/mdschema_0.13.2_linux_amd64.tar.gz'
      sha256 '42f7e02ec4538717b3993d777b2ca2dee16aacea87b1ff1ddc267853091e7a81'
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
