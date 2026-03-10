class Mdschema < Formula
  desc '📝 A declarative schema-based Markdown validator that helps maintain consistent documentation structure across projects.'
  version '0.12.5'
  homepage 'https://github.com/jackchuka/mdschema'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.12.5/mdschema_0.12.5_darwin_arm64.tar.gz'
      sha256 'fd64d0fd03ec4ed46b115d5bd8e47a8030da52e78a37121c5933e59b019a1bee'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.12.5/mdschema_0.12.5_darwin_amd64.tar.gz'
      sha256 '17ab82289a8a627ba0035e18d88742321f0f6e65c280d10231738a75d12ce7e5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.12.5/mdschema_0.12.5_linux_arm64.tar.gz'
      sha256 'e8860ea6d4c8cc7285527796f0234043a8fefc7f171577129ee4754ea61a40df'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.12.5/mdschema_0.12.5_linux_amd64.tar.gz'
      sha256 'ea9a864638071a5b8004de13b499c122362ce631beb5c904dd2d25c8b437f5ef'
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
