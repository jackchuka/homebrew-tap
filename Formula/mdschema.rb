class Mdschema < Formula
  desc '📝 A declarative schema-based Markdown validator that helps maintain consistent documentation structure across projects.'
  version '0.14.1'
  homepage 'https://github.com/jackchuka/mdschema'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.14.1/mdschema_0.14.1_darwin_arm64.tar.gz'
      sha256 '03ab3e0f4bc4835c156a65104ab503bd48dd36251ad8dabdbe77d690deea1436'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.14.1/mdschema_0.14.1_darwin_amd64.tar.gz'
      sha256 'bda13e885f00737868f56527a2cd215d9e8a682b54bb81fe7283d1b646b9d4ef'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.14.1/mdschema_0.14.1_linux_arm64.tar.gz'
      sha256 '0fd0631da772a72b0c7c9fb81b4136826cacd1a161da4ce395bd778bb2ada050'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.14.1/mdschema_0.14.1_linux_amd64.tar.gz'
      sha256 '1fc66f3e288ba55b80b9bf78becfd22345ee535af4280e298454cca462671990'
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
