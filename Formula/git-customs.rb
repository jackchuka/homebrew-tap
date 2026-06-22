class GitCustoms < Formula
  desc 'Pre-push gate that catches PII and secrets before they reach a public remote'
  version '0.1.0'
  homepage 'https://github.com/jackchuka/git-customs'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/git-customs/releases/download/v0.1.0/git-customs_0.1.0_darwin_arm64.tar.gz'
      sha256 '5315d529c7ab970d69c60ba184f920c35eb4ec6e0e30adbaf043b0f9b83287f7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/git-customs/releases/download/v0.1.0/git-customs_0.1.0_darwin_amd64.tar.gz'
      sha256 'd163ada9d41248d293a7ba2736a31b064670891c1d6b7abdd4a318051b3e3fd0'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/git-customs/releases/download/v0.1.0/git-customs_0.1.0_linux_arm64.tar.gz'
      sha256 '642723a313384caddbe94a22d954d2884b2281fc68e978104b4c4a7226913549'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/git-customs/releases/download/v0.1.0/git-customs_0.1.0_linux_amd64.tar.gz'
      sha256 '4f691e5396c2ad494aa7c11813d4067c5cb8579d7e15ebfcb0179ee583ecb01e'
    end
  end

  head do
    url 'https://github.com/jackchuka/git-customs.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'go', 'build', '-o', 'git-customs', '.'
    end
    bin.install 'git-customs'
  end
end
