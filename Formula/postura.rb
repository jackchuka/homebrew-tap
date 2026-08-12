class Postura < Formula
  desc 'A deterministic CLI that audits your GitHub enterprise, orgs, and repos against a security baseline you own — rules are data, the bar is per-target.'
  version '0.3.1'
  homepage 'https://github.com/jackchuka/postura'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/postura/releases/download/v0.3.1/postura_0.3.1_darwin_arm64.tar.gz'
      sha256 '75ca55d5507c8762cb5a19ecc973532281fbcf7e78728317adf638611d829da9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/postura/releases/download/v0.3.1/postura_0.3.1_darwin_amd64.tar.gz'
      sha256 '8e6930130665804452be4918a74c7d3b7b111a1f982fc7791f32cd179d1704a8'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/postura/releases/download/v0.3.1/postura_0.3.1_linux_arm64.tar.gz'
      sha256 'f17a5f684a03e58f2ec75d40fd98ab846fba40599d428030b7d91e86c1bc8030'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/postura/releases/download/v0.3.1/postura_0.3.1_linux_amd64.tar.gz'
      sha256 '4f0d7a2505a0a1767d6ddb322caffc9c5ee2ab3112826ea1dcef419a0fffabfb'
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
