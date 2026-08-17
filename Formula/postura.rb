class Postura < Formula
  desc 'A deterministic CLI that audits your GitHub enterprise, orgs, and repos against a security baseline you own — rules are data, the bar is per-target.'
  version '0.3.2'
  homepage 'https://github.com/jackchuka/postura'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/postura/releases/download/v0.3.2/postura_0.3.2_darwin_arm64.tar.gz'
      sha256 '96c365fafacecfd439537a1e471948d65606cdf546200865df40106979122fdb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/postura/releases/download/v0.3.2/postura_0.3.2_darwin_amd64.tar.gz'
      sha256 '896af16a19143c155b0f417b83091ef8fc17356d398941ef90f113a0ac4d2bee'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/postura/releases/download/v0.3.2/postura_0.3.2_linux_arm64.tar.gz'
      sha256 '83413da8513e4673f1b82c57b8495e8cc25fdf346fb1d31cba2e03c1fe9dad46'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/postura/releases/download/v0.3.2/postura_0.3.2_linux_amd64.tar.gz'
      sha256 '98f3e30ff1da2ca8541890d4ef9b800d625a7b80a583b3bc25bd44e5f4d48ba5'
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
