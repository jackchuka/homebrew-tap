class GitCustoms < Formula
  desc 'Pre-push gate that catches PII and secrets before they reach a public remote'
  version '0.1.4'
  homepage 'https://github.com/jackchuka/git-customs'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/git-customs/releases/download/v0.1.4/git-customs_0.1.4_darwin_arm64.tar.gz'
      sha256 '65b79a7780b809e75115e2a657fa7d893bdf78dfdaa8526198eebda42605c96d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/git-customs/releases/download/v0.1.4/git-customs_0.1.4_darwin_amd64.tar.gz'
      sha256 '2d66852e0d63d8af10eba451dd4fc82a9a96bd5cd0b30672d66d458216a2465d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/git-customs/releases/download/v0.1.4/git-customs_0.1.4_linux_arm64.tar.gz'
      sha256 'aeb6181c2f21387692cd3efe56ac5f8f13188e4ecf03e7d19e3ffeb564764a3c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/git-customs/releases/download/v0.1.4/git-customs_0.1.4_linux_amd64.tar.gz'
      sha256 'ad33c72a6208a3e3d38f5c980c340b7b54ffbce31a4e318de9ba8c4cc9201809'
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
