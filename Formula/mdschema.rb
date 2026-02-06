class Mdschema < Formula
  desc '📝 A declarative schema-based Markdown validator that helps maintain consistent documentation structure across projects.'
  version '0.11.0'
  homepage 'https://github.com/jackchuka/mdschema'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.11.0/mdschema_0.11.0_darwin_arm64.tar.gz'
      sha256 'ed3195317dadb7c896065c139cbef6548920fa3ce60818fd56134f5ebbc74869'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.11.0/mdschema_0.11.0_darwin_amd64.tar.gz'
      sha256 '19a0e305b97d404cdd9b4b3483bda1bcace72e54d603ccc19c9db86fd20d1075'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.11.0/mdschema_0.11.0_linux_arm64.tar.gz'
      sha256 '396b7adf32d0d660c24adb806c0d9507b3469cc90b300dd88756e3b8a80bca71'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.11.0/mdschema_0.11.0_linux_amd64.tar.gz'
      sha256 '686349a41d90357d12cc02fa264039ee49f6296bcaea46d48526ba036c3618b4'
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
