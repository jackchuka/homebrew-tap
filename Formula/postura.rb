class Postura < Formula
  desc 'A deterministic CLI that audits your GitHub enterprise, orgs, and repos against a security baseline you own — rules are data, the bar is per-target.'
  version '0.1.0'
  homepage 'https://github.com/jackchuka/postura'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/postura/releases/download/v0.1.0/postura_0.1.0_darwin_arm64.tar.gz'
      sha256 '2b1d96a71b59b4469f93e485ac70d0723ea8717f750093f0ec53a33f9ce8ef01'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/postura/releases/download/v0.1.0/postura_0.1.0_darwin_amd64.tar.gz'
      sha256 'df50ad3c17e6fd15de16ebbfa3d01c19746f8099ec51af30eb6559518c424fc4'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/postura/releases/download/v0.1.0/postura_0.1.0_linux_arm64.tar.gz'
      sha256 '2a872f7dd51dfca2ab3d15b9a99aa47aabb5f5194085a051cb870c1051363bf2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/postura/releases/download/v0.1.0/postura_0.1.0_linux_amd64.tar.gz'
      sha256 'cf7f1e167a857ab333c36ff1d9381bd117c98e68870e5f027ae8ec3bec71e54a'
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
