class ConfluenceMd < Formula
  desc '🧭 From Confluence to clean Markdown, images and all — just one command'
  version '0.3.18'
  homepage 'https://github.com/jackchuka/confluence-md'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.18/confluence-md_0.3.18_darwin_arm64.tar.gz'
      sha256 '1640f127c1848ba797186616b45b6a84ec09d545736c65889d700850d141b46e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.18/confluence-md_0.3.18_darwin_amd64.tar.gz'
      sha256 'e4b884d6d9ae049d9d92730aa643036498b9a0c54809a98572b6de811c753539'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.18/confluence-md_0.3.18_linux_arm64.tar.gz'
      sha256 'aab04118b29cf5d4c95a361075f2f3dca791933d404c23221d7b779992ff5964'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.18/confluence-md_0.3.18_linux_amd64.tar.gz'
      sha256 '0af90d397597fa31ed925a7867193cbd3d4a54e88b2251b5bd18f4f72c84373c'
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
