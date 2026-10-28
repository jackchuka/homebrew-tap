class Goalias < Formula
  desc 'Instantly standardize Go import aliases across your entire codebase with LSP-powered precision.'
  version '1.0.15'
  homepage 'https://github.com/jackchuka/goalias'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.15/goalias_1.0.15_darwin_arm64.tar.gz'
      sha256 'a5341481f78577900bb2829e531ae079c470f652a8fcde8effda582b169ebe75'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.15/goalias_1.0.15_darwin_amd64.tar.gz'
      sha256 '3c953650aee6327484f14244c67e6a942635753fa699549d389fcce583acac3b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.15/goalias_1.0.15_linux_arm64.tar.gz'
      sha256 'a2c8e7ed5430791511f70c284374a6fcdb0de23ab0f430c0ce49713674bf185e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/goalias/releases/download/v1.0.15/goalias_1.0.15_linux_amd64.tar.gz'
      sha256 '07e98898fb778e60ac51cf4da41e5eb89e9906ea4db4e3bd0a79a32f72a2f82b'
    end
  end

  head do
    url 'https://github.com/jackchuka/goalias.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'goalias'
  end
end
