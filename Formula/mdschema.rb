class Mdschema < Formula
  desc '📝 A declarative schema-based Markdown validator that helps maintain consistent documentation structure across projects.'
  version '0.12.10'
  homepage 'https://github.com/jackchuka/mdschema'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.12.10/mdschema_0.12.10_darwin_arm64.tar.gz'
      sha256 'f1567c552ccfad790aa4e8a9f579e3ac2b2109866b97681f5b1fdfa9161be501'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.12.10/mdschema_0.12.10_darwin_amd64.tar.gz'
      sha256 '603fc40e1ab269cb019be211ea995519e92bd0fa785db1534814657d421936df'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.12.10/mdschema_0.12.10_linux_arm64.tar.gz'
      sha256 'e0e7d3cf2409210d39fde738cc32a7dd24b77fadb5d77d201479cd93d380b3d7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.12.10/mdschema_0.12.10_linux_amd64.tar.gz'
      sha256 '58fcf9142da1dba1fd5aadd9dd8281046cc3fd0e2f058012a2f8f0a783e59682'
    end
  end

  head do
    url 'https://github.com/jackchuka/mdschema.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'mdschema'
  end
end
