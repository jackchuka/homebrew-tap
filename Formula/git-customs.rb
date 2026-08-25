class GitCustoms < Formula
  desc 'Pre-push gate that catches PII and secrets before they reach a public remote'
  version '0.1.5'
  homepage 'https://github.com/jackchuka/git-customs'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/git-customs/releases/download/v0.1.5/git-customs_0.1.5_darwin_arm64.tar.gz'
      sha256 '17a3559cdff07ab9c78ce2dd0be71b56f0ca3bb034168360de0a124275ebdf2a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/git-customs/releases/download/v0.1.5/git-customs_0.1.5_darwin_amd64.tar.gz'
      sha256 '962dd344c5d739dde6734e29fc14c815a3916d0d90eddcbcdefac77603578ff2'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/git-customs/releases/download/v0.1.5/git-customs_0.1.5_linux_arm64.tar.gz'
      sha256 'd3a183914a8344184ab35f9671eaf28ddac7a9eed0c0a40a985380e1d92a185f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/git-customs/releases/download/v0.1.5/git-customs_0.1.5_linux_amd64.tar.gz'
      sha256 'cb8b11af69191650b26be45ad08a4fc5eb3cf8331d2334b941e108a3e99250cc'
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
