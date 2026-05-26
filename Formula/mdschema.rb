class Mdschema < Formula
  desc '📝 A declarative schema-based Markdown validator that helps maintain consistent documentation structure across projects.'
  version '0.13.1'
  homepage 'https://github.com/jackchuka/mdschema'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.13.1/mdschema_0.13.1_darwin_arm64.tar.gz'
      sha256 '31c18f53f8016bce0e39b2186dba46ee6a33ec7c856e52bd267375d3bb11c74c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.13.1/mdschema_0.13.1_darwin_amd64.tar.gz'
      sha256 '5e3dd536fe91555987795e45de7c7ff85a6743664b3ad25658a6266194d76bbe'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.13.1/mdschema_0.13.1_linux_arm64.tar.gz'
      sha256 'f05d59619c880a96a98f2f214a641c68ed95aef03392fe4562145552cc190c6e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.13.1/mdschema_0.13.1_linux_amd64.tar.gz'
      sha256 '9389f2d627050a2f550cda788b8f67e5737d17eab990ef64285a7a64edce8806'
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
