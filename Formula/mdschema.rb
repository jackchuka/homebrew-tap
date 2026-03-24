class Mdschema < Formula
  desc '📝 A declarative schema-based Markdown validator that helps maintain consistent documentation structure across projects.'
  version '0.12.7'
  homepage 'https://github.com/jackchuka/mdschema'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.12.7/mdschema_0.12.7_darwin_arm64.tar.gz'
      sha256 'e115bae76dfe04f476e5068fbdf893c3b05b40b301f20f21cb8c075b7962dc91'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.12.7/mdschema_0.12.7_darwin_amd64.tar.gz'
      sha256 '1c605d7dcc820d6b4e539848ca33c501d994b9e7bb38557876b853b31a120f26'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.12.7/mdschema_0.12.7_linux_arm64.tar.gz'
      sha256 'f24e58253f208d14caf1d401b66066a0594d7a93791bed8dc666968ad0c4b0f0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.12.7/mdschema_0.12.7_linux_amd64.tar.gz'
      sha256 'a35cd2e0445addf521376ffc47fd13992aec3f402b13703a44cb013777a2ed4e'
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
