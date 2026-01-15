class Mdschema < Formula
  desc '📝 A declarative schema-based Markdown validator that helps maintain consistent documentation structure across projects.'
  version '0.3.0'
  homepage 'https://github.com/jackchuka/mdschema'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.3.0/mdschema_0.3.0_darwin_arm64.tar.gz'
      sha256 'db9b4111c165252f1730439f394bef2fbbaba5e5a8f951499ebf68694846dc68'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.3.0/mdschema_0.3.0_darwin_amd64.tar.gz'
      sha256 '1984739a9e7d009916935e842cc30d4d2ec1c0182e52bb16dc25f5fbc0cf3c30'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.3.0/mdschema_0.3.0_linux_arm64.tar.gz'
      sha256 '9c36a1fe2ceb1a3d1be7a3461afdb277bff1100bb8e85297a0b704a0388bf856'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.3.0/mdschema_0.3.0_linux_amd64.tar.gz'
      sha256 'c469da0930c927e11fb5a04fa784cc179cc0e644f6289885c2e4e350c4ed5d61'
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
