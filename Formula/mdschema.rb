class Mdschema < Formula
  desc '📝 A declarative schema-based Markdown validator that helps maintain consistent documentation structure across projects.'
  version '0.12.9'
  homepage 'https://github.com/jackchuka/mdschema'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.12.9/mdschema_0.12.9_darwin_arm64.tar.gz'
      sha256 '08eb57289a2eecaee8438946fee58656387deb933756c9f1f1ce7405aa2c42ef'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.12.9/mdschema_0.12.9_darwin_amd64.tar.gz'
      sha256 '47c8c4dfae90a46e0c7e186bc1fe6e26de4f21b490ef620eeae45ab40d8f53e4'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.12.9/mdschema_0.12.9_linux_arm64.tar.gz'
      sha256 'a833ee8cb49935af0338638033c7914924fd7e551a13c8cd594d32c17be1e667'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.12.9/mdschema_0.12.9_linux_amd64.tar.gz'
      sha256 'aec26472681104e3a4e7a22a59903dc88753e05acc8040a08773ed1771aabfaf'
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
