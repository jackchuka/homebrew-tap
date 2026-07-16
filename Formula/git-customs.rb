class GitCustoms < Formula
  desc 'Pre-push gate that catches PII and secrets before they reach a public remote'
  version '0.1.1'
  homepage 'https://github.com/jackchuka/git-customs'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/git-customs/releases/download/v0.1.1/git-customs_0.1.1_darwin_arm64.tar.gz'
      sha256 '53162a7d18de90bd10fc2bb5cd35d194cd8cdcd427234a58baf2431b50a3deca'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/git-customs/releases/download/v0.1.1/git-customs_0.1.1_darwin_amd64.tar.gz'
      sha256 '8599d157031f1f3c075d41cdfd28c0c6b7370b78cb6d1622b5474164c809d539'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/git-customs/releases/download/v0.1.1/git-customs_0.1.1_linux_arm64.tar.gz'
      sha256 'd4d29aa9666395325f8f77c278d32df10c2f1c16e7cbff7c81d1c969e0560afc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/git-customs/releases/download/v0.1.1/git-customs_0.1.1_linux_amd64.tar.gz'
      sha256 '055c4a636c88c264fe915bbb74e34471f0288fbb48ec622050f2f04b0a52c492'
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
