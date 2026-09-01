class Postura < Formula
  desc 'A deterministic CLI that audits your GitHub enterprise, orgs, and repos against a security baseline you own — rules are data, the bar is per-target.'
  version '0.4.0'
  homepage 'https://github.com/jackchuka/postura'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/postura/releases/download/v0.4.0/postura_0.4.0_darwin_arm64.tar.gz'
      sha256 '2777a39b658c429c6074cb90b28d0c607c89f29077244457244127953d632014'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/postura/releases/download/v0.4.0/postura_0.4.0_darwin_amd64.tar.gz'
      sha256 '191e555ebe3e3146bb7f4294988d3c83d165c8c24528038ba98341fef74c6ef6'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/postura/releases/download/v0.4.0/postura_0.4.0_linux_arm64.tar.gz'
      sha256 '0cff7ac53283e237a6a7a6e98eed3a506b865372b82bae412337af4bd442b38a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/postura/releases/download/v0.4.0/postura_0.4.0_linux_amd64.tar.gz'
      sha256 '4d9eed2d024677a4a9abc8d87f3ff0bb78e936244cf1761e9bf041ad615e87a3'
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
