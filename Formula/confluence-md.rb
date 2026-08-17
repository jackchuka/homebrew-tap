class ConfluenceMd < Formula
  desc '🧭 From Confluence to clean Markdown, images and all — just one command'
  version '0.3.20'
  homepage 'https://github.com/jackchuka/confluence-md'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.20/confluence-md_0.3.20_darwin_arm64.tar.gz'
      sha256 '24607890758f84a5ae55ab84c6aaa6a901b67ff4cff2284db3471e494df9543a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.20/confluence-md_0.3.20_darwin_amd64.tar.gz'
      sha256 '4df337ac0326ad5696f7af3512d6a04c7f093a4988848161db325daa0ede6687'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.20/confluence-md_0.3.20_linux_arm64.tar.gz'
      sha256 'f4d2e749ad3c5c190e5e17bb06bd46f617830736241cfbe129defac1bb38d288'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.20/confluence-md_0.3.20_linux_amd64.tar.gz'
      sha256 '16a57168211b9c1ca52fd3c31bfba46d2f87546cf8a0f937575642d011338a57'
    end
  end

  head do
    url 'https://github.com/jackchuka/confluence-md.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'confluence-md'
  end
end
