class Mdschema < Formula
  desc '📝 A declarative schema-based Markdown validator that helps maintain consistent documentation structure across projects.'
  version '0.7.0'
  homepage 'https://github.com/jackchuka/mdschema'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.7.0/mdschema_0.7.0_darwin_arm64.tar.gz'
      sha256 '7d752f072245d4d78b0719810fb84698813cb705fd99c6e9df3a68f696eea75a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.7.0/mdschema_0.7.0_darwin_amd64.tar.gz'
      sha256 'a95baefc218eea60219dbc8dfaf1207f7bf131baffee117f94a2b5af3008d515'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.7.0/mdschema_0.7.0_linux_arm64.tar.gz'
      sha256 'a05920fd6df4a53cec1697c35f96648f340db3a4ff5575fe4470b079c2efb34d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.7.0/mdschema_0.7.0_linux_amd64.tar.gz'
      sha256 '948022cab8288c67ff1c84ab281002496a74e4bce6de7311313ffef5a752d8a1'
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
