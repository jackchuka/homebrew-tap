class ConfluenceMd < Formula
  desc 'From Confluence to clean Markdown, images and all, in one command'
  version '0.3.25'
  homepage 'https://github.com/jackchuka/confluence-md'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.25/confluence-md_0.3.25_darwin_arm64.tar.gz'
      sha256 '765a99df6db07f41dce0b6843c792bb1fe451097a19a7b5724fac30ed926a36e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.25/confluence-md_0.3.25_darwin_amd64.tar.gz'
      sha256 '8da1b6e4c11fb0b22993482a2edc3c3324928efe2cb7efd1ff741ffacf640a2f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.25/confluence-md_0.3.25_linux_arm64.tar.gz'
      sha256 '240a5c57b21979e77b46febb87a849d6beae68497cf17273eee9d8ec99b3130e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/confluence-md/releases/download/v0.3.25/confluence-md_0.3.25_linux_amd64.tar.gz'
      sha256 'b7f17da577d18453e6bdfb9906f2b6ef800c01b7f85545b4d67f110974d65dd1'
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
