class Mdschema < Formula
  desc '📝 A declarative schema-based Markdown validator that helps maintain consistent documentation structure across projects.'
  version '0.11.1'
  homepage 'https://github.com/jackchuka/mdschema'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.11.1/mdschema_0.11.1_darwin_arm64.tar.gz'
      sha256 '857798f10640574c1a5fa2a743d9bd7a1baa706a7c5326894a8289cadcb8f1b5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.11.1/mdschema_0.11.1_darwin_amd64.tar.gz'
      sha256 '139c61dba65a7de8edd32ab1d0234a9952907593f1d47212e5ed351c3791cb7a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.11.1/mdschema_0.11.1_linux_arm64.tar.gz'
      sha256 'c5e6cc0073e0deb33b97d0af611416f9d0c1dfe5f1ad4bd4ffb88ec230ee7c14'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.11.1/mdschema_0.11.1_linux_amd64.tar.gz'
      sha256 'c0de1e0334f3feb6d48fe6b5179a940ffde442fde5911623f8d6605c69caa859'
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
