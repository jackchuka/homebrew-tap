class ConfluenceMd < Formula
  desc '🧭 From Confluence to clean Markdown, images and all — just one command'
  version '0.3.7'
  homepage 'https://github.com/jackchuka/confluence-md'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.7/confluence-md_0.3.7_darwin_arm64.tar.gz'
      sha256 '809977e067e89829ac5449668c8e7244b9be063f0086c31864867c326d1000e5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.7/confluence-md_0.3.7_darwin_amd64.tar.gz'
      sha256 '414fee554471a8a7720cf376bb047cbce1b0daa0c14ae8ca8822caaf18197610'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.7/confluence-md_0.3.7_linux_arm64.tar.gz'
      sha256 '1dd6798128b54b00078329edd32f051a77207dab23bb54006fbe11cc8ac04770'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.7/confluence-md_0.3.7_linux_amd64.tar.gz'
      sha256 'e8fbdf55b020383d51a74bc6f158346cece6cfb064352fc2d6baab6537647814'
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
