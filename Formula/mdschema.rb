class Mdschema < Formula
  desc '📝 A declarative schema-based Markdown validator that helps maintain consistent documentation structure across projects.'
  version '0.10.0'
  homepage 'https://github.com/jackchuka/mdschema'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.10.0/mdschema_0.10.0_darwin_arm64.tar.gz'
      sha256 '220794ffaa165cf921fbfe1b43ad2742fef1882e027d8c60c0005ab525734d86'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.10.0/mdschema_0.10.0_darwin_amd64.tar.gz'
      sha256 '0c2f451d250b604b15136580047f69ec3e46db73861eda305d0f2fb6138e8562'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.10.0/mdschema_0.10.0_linux_arm64.tar.gz'
      sha256 '04798ea01e35333deba59b39fb84c8013fa782f70b84154bb370576345c7764c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.10.0/mdschema_0.10.0_linux_amd64.tar.gz'
      sha256 '17b869e58cd3f9a925b86d97faa9bf16b26804f2a920c115a795ed307507f697'
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
