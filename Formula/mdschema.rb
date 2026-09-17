class Mdschema < Formula
  desc '📝 A declarative schema-based Markdown validator that helps maintain consistent documentation structure across projects.'
  version '0.15.4'
  homepage 'https://github.com/jackchuka/mdschema'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.15.4/mdschema_0.15.4_darwin_arm64.tar.gz'
      sha256 '72be30f1e92752fc2d4006b7f592fe3dee53361577620de6cc319268152ef9a9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.15.4/mdschema_0.15.4_darwin_amd64.tar.gz'
      sha256 '6b8e397e86326b7408ca4903b935970be476783852bfa9cf04fc46fcf6025484'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.15.4/mdschema_0.15.4_linux_arm64.tar.gz'
      sha256 'fe9b672788eab21d12878d21f68753bebaad352357723cd6187dc19309d1a93a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.15.4/mdschema_0.15.4_linux_amd64.tar.gz'
      sha256 '29f32c98fddcde9dc5381e56df0490f5e45436df7260aeb8afa0161eab63fb81'
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
