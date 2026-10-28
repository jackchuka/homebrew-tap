class GitCustoms < Formula
  desc 'Client-side, cross-host pre-push gate that catches PII and secrets — using an engine you choose — before anything reaches a public remote.'
  version '0.1.7'
  homepage 'https://github.com/jackchuka/git-customs'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/git-customs/releases/download/v0.1.7/git-customs_0.1.7_darwin_arm64.tar.gz'
      sha256 'c01de88ebdac7ab6c7d3995989921887aa45a45561ce9608e4ab24d739ef6227'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/git-customs/releases/download/v0.1.7/git-customs_0.1.7_darwin_amd64.tar.gz'
      sha256 'c965eaa814d84009a87b3a47b3a69783d62d3bfc17eb13596dc652ac0d8efc8b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/git-customs/releases/download/v0.1.7/git-customs_0.1.7_linux_arm64.tar.gz'
      sha256 'ec807da5c134dc9bfb622c45e8b3d9e48388c6ef43dfa3b6c9a17b2cb3f06874'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/git-customs/releases/download/v0.1.7/git-customs_0.1.7_linux_amd64.tar.gz'
      sha256 'dd34d00a31f19619be6fd5d8a5caecb62505aadca1309e9df055203d1c362f8d'
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
