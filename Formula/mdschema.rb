class Mdschema < Formula
  desc '📝 A declarative schema-based Markdown validator that helps maintain consistent documentation structure across projects.'
  version '0.15.5'
  homepage 'https://github.com/jackchuka/mdschema'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.15.5/mdschema_0.15.5_darwin_arm64.tar.gz'
      sha256 '81f946f5e714cb8d8723626900bba2850ec0707c55886d0e492a7c858796160d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.15.5/mdschema_0.15.5_darwin_amd64.tar.gz'
      sha256 '3ef8d58466bd403da7f836fb1fe4f3f1ffa6de1c9e04c57838f00fa05a5af4d1'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.15.5/mdschema_0.15.5_linux_arm64.tar.gz'
      sha256 'ee0469b903f3ae44f94fb4bc2d7b049c452677633850dc83808bc6ca54ddf6cb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.15.5/mdschema_0.15.5_linux_amd64.tar.gz'
      sha256 'f82a6c79820e36cd52465bccfaebeda94b2a8014675cc7054d831b7a57ea204f'
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
