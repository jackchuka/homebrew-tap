class Mdschema < Formula
  desc '📝 A declarative schema-based Markdown validator that helps maintain consistent documentation structure across projects.'
  version '0.9.0'
  homepage 'https://github.com/jackchuka/mdschema'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.9.0/mdschema_0.9.0_darwin_arm64.tar.gz'
      sha256 'e5fbc51ce49f1ea4ca08229e61276881fbd772a96515f10a619941a33b30855f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.9.0/mdschema_0.9.0_darwin_amd64.tar.gz'
      sha256 'f0e3c1f50149464caf00623d7444d5a89adaedb800bb3e6e69a504b417bcb253'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.9.0/mdschema_0.9.0_linux_arm64.tar.gz'
      sha256 '592be0d1b4b14a1fb9b74a6932c0144bd7b8a0240c0b998540ee0a5651ecbf81'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.9.0/mdschema_0.9.0_linux_amd64.tar.gz'
      sha256 '8910e7410d2500371a29f40dd364cde04978992473d0ba06cd9af60b80dbfbdb'
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
