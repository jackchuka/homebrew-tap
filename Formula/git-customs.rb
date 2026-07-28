class GitCustoms < Formula
  desc 'Pre-push gate that catches PII and secrets before they reach a public remote'
  version '0.1.3'
  homepage 'https://github.com/jackchuka/git-customs'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/git-customs/releases/download/v0.1.3/git-customs_0.1.3_darwin_arm64.tar.gz'
      sha256 '7e85ffec6083d899673a2dc0e9e5e7c320950dd8b102bae09d6c16444f16ce44'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/git-customs/releases/download/v0.1.3/git-customs_0.1.3_darwin_amd64.tar.gz'
      sha256 'f5fed8240524d16a51517736f25ce8d8a78f12fade915393127f46cdeb4a0696'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/git-customs/releases/download/v0.1.3/git-customs_0.1.3_linux_arm64.tar.gz'
      sha256 'cf9cf5bb52dbce5c244830314564e22e65a639ffebde780138a083114ae32832'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/git-customs/releases/download/v0.1.3/git-customs_0.1.3_linux_amd64.tar.gz'
      sha256 '50a269e574aa4ac3c896e1b8ae3e6ad9535bfa8fb1ca4cd86179f6989d340a0d'
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
