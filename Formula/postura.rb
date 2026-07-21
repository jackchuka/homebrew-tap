class Postura < Formula
  desc 'A deterministic CLI that audits your GitHub enterprise, orgs, and repos against a security baseline you own — rules are data, the bar is per-target.'
  version '0.2.3'
  homepage 'https://github.com/jackchuka/postura'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/postura/releases/download/v0.2.3/postura_0.2.3_darwin_arm64.tar.gz'
      sha256 '5b19d17ee3b42d7e88c1c7b59ac5450a6415022158d7bde7b713bf9c263a43c0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/postura/releases/download/v0.2.3/postura_0.2.3_darwin_amd64.tar.gz'
      sha256 '6b2f6c7b12316719cce0e418a55c4cfef515668923c1f77b56ee1d107c875df0'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/postura/releases/download/v0.2.3/postura_0.2.3_linux_arm64.tar.gz'
      sha256 '1aed1e2b0af2bd6eb155eb6074d2f932192dddc9ddc6e6b098c88692643adef7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/postura/releases/download/v0.2.3/postura_0.2.3_linux_amd64.tar.gz'
      sha256 '8b71f075399aadcd9d020c96f4f141735c05b2c1af407da925362a3edfb5d137'
    end
  end

  head do
    url 'https://github.com/jackchuka/postura.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'go', 'build', '-o', 'postura', '.'
    end
    bin.install 'postura'
  end

  test do
    system "#{bin}/postura", '-h'
  end
end
