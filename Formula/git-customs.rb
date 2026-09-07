class GitCustoms < Formula
  desc 'Pre-push gate that catches PII and secrets before they reach a public remote'
  version '0.1.6'
  homepage 'https://github.com/jackchuka/git-customs'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/git-customs/releases/download/v0.1.6/git-customs_0.1.6_darwin_arm64.tar.gz'
      sha256 '1a09ff75eabb37492d7a18829816ab66163a429ded6d2830b17fba8631860fa8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/git-customs/releases/download/v0.1.6/git-customs_0.1.6_darwin_amd64.tar.gz'
      sha256 '8fa293df453db0823a348b9358ab403e5e65d0cb2f09fa28c3607a01c3823b57'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/git-customs/releases/download/v0.1.6/git-customs_0.1.6_linux_arm64.tar.gz'
      sha256 'c4d99cec1be3b7ed718502f7de9f3b0daf939fc0d50191cdda8a134f2d24ecb1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/git-customs/releases/download/v0.1.6/git-customs_0.1.6_linux_amd64.tar.gz'
      sha256 '57e42851307a39d53341bc092edeb4eb3182b3880a40a8989927721559a9f97d'
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
