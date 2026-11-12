class Mdschema < Formula
  desc 'A declarative schema-based Markdown validator that helps maintain consistent documentation structure across projects.'
  version '0.16.0'
  homepage 'https://github.com/jackchuka/mdschema'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.16.0/mdschema_0.16.0_darwin_arm64.tar.gz'
      sha256 'd05ce2261aa332ba4a254b4f65741eb2b020834c27555bdf32f70b326558d51b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.16.0/mdschema_0.16.0_darwin_amd64.tar.gz'
      sha256 '1c39a11f75688f2285a52d0ee6f58b91a67436474f429f33cea0dbd850227e0e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.16.0/mdschema_0.16.0_linux_arm64.tar.gz'
      sha256 'bf904d002e85f97cafc4c5edaebf04556c4384d63864f1bf63fcd0e43dfc5253'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.16.0/mdschema_0.16.0_linux_amd64.tar.gz'
      sha256 '960db79a32d777665cc98141c7acc1060aaa778065678fe35e981007b6734cef'
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
