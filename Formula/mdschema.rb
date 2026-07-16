class Mdschema < Formula
  desc '📝 A declarative schema-based Markdown validator that helps maintain consistent documentation structure across projects.'
  version '0.13.3'
  homepage 'https://github.com/jackchuka/mdschema'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.13.3/mdschema_0.13.3_darwin_arm64.tar.gz'
      sha256 '3d48b4be36ee456f5c7501c99758ddbf92097db398ebce6bbe73d8fdafe5a09a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.13.3/mdschema_0.13.3_darwin_amd64.tar.gz'
      sha256 'c9cb50ddf4a13b37f162b402760ed2712117a693958e6447cf7ec5c8315c77aa'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.13.3/mdschema_0.13.3_linux_arm64.tar.gz'
      sha256 'a1d907e356198c6efc318be68ffd64a097e9a6a9f8e037be33c175871cc12ef2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.13.3/mdschema_0.13.3_linux_amd64.tar.gz'
      sha256 'bff674601b729854f9275d419de421f4769a22b5f77d02ee7350d76c88167fe5'
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
