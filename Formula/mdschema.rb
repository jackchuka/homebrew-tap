class Mdschema < Formula
  desc '📝 A declarative schema-based Markdown validator that helps maintain consistent documentation structure across projects.'
  version '0.12.3'
  homepage 'https://github.com/jackchuka/mdschema'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.12.3/mdschema_0.12.3_darwin_arm64.tar.gz'
      sha256 'efb746a3a82043d32d44336ea0cd508311229ee9c2d3bd57e8f02b4eba80f135'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.12.3/mdschema_0.12.3_darwin_amd64.tar.gz'
      sha256 'bdd0da171b585f513d9a96f98bcca0164ff00542eb90336548c7e506817572ff'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.12.3/mdschema_0.12.3_linux_arm64.tar.gz'
      sha256 '314c835a730ac30ae5240b73c5f7fb4d7f8b14e29ad3423bf3c1ad00a16e06a6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.12.3/mdschema_0.12.3_linux_amd64.tar.gz'
      sha256 '59bf78d782a3fc5fe76cf0467a311595368292d58a1ae39db04a2543a374a2d5'
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
