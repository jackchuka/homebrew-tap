class Mdschema < Formula
  desc 'A declarative schema-based Markdown validator that helps maintain consistent documentation structure across projects.'
  version '0.15.6'
  homepage 'https://github.com/jackchuka/mdschema'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.15.6/mdschema_0.15.6_darwin_arm64.tar.gz'
      sha256 '304513d1d741288d585e58209383bd4e8f6c707d54774a61cbc0bd748fc6e900'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.15.6/mdschema_0.15.6_darwin_amd64.tar.gz'
      sha256 '882ca437d896a41421e99a41b16e1f0350f7752a059845e25dfccbb2727c7278'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.15.6/mdschema_0.15.6_linux_arm64.tar.gz'
      sha256 '2adc047b24b7a45c8b054e7a5180b775e986970d7f055b178e874304e215864d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.15.6/mdschema_0.15.6_linux_amd64.tar.gz'
      sha256 'd0f4be5be99e75aca7c649c11d4b8f4fa99c87cca9e40025cdb5e1c4e3a59bf7'
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
