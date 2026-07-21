class GitCustoms < Formula
  desc 'Pre-push gate that catches PII and secrets before they reach a public remote'
  version '0.1.2'
  homepage 'https://github.com/jackchuka/git-customs'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/git-customs/releases/download/v0.1.2/git-customs_0.1.2_darwin_arm64.tar.gz'
      sha256 '095a5deda3ed22568066523e26618595951ccc5a567defa5e7534498efcf5870'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/git-customs/releases/download/v0.1.2/git-customs_0.1.2_darwin_amd64.tar.gz'
      sha256 '60d03ac158fcef8f0869791c365652070ee0e74af278bbc06a58eb7b4b42169d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/git-customs/releases/download/v0.1.2/git-customs_0.1.2_linux_arm64.tar.gz'
      sha256 'fbff809253f6a741fcc4f0f199a36ec1f90c599a2840dc2b9d86eb2eaeb8d364'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/git-customs/releases/download/v0.1.2/git-customs_0.1.2_linux_amd64.tar.gz'
      sha256 '2a582d58df3cd0a4e24ec22214997ded79de31ce8b28606c334e897b5dc221b6'
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
