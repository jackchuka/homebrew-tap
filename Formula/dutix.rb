class Dutix < Formula
  desc 'Set default apps, migrate file associations, and manage handlers on macOS'
  version '0.1.3'
  homepage 'https://github.com/jackchuka/dutix'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/dutix/releases/download/v0.1.3/dutix_0.1.3_darwin_arm64.tar.gz'
      sha256 '9a2ba1599da14c37aee8c5d2e6054c37e1e1697ffcc280f439b04fbe8e1c240f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/dutix/releases/download/v0.1.3/dutix_0.1.3_darwin_amd64.tar.gz'
      sha256 '9dda6caeaaf1c214e11098d533bfa6e09fdc8d57420449b42ab4ad69e7890d46'
    end
  end

  head do
    url 'https://github.com/jackchuka/dutix.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'dutix'
  end
end
