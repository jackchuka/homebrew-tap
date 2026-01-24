class Mdschema < Formula
  desc '📝 A declarative schema-based Markdown validator that helps maintain consistent documentation structure across projects.'
  version '0.5.1'
  homepage 'https://github.com/jackchuka/mdschema'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.5.1/mdschema_0.5.1_darwin_arm64.tar.gz'
      sha256 '253d086fcf42b62d4e1e756a62a7de4a9a72c031f29833153af27f3964cbfc9e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.5.1/mdschema_0.5.1_darwin_amd64.tar.gz'
      sha256 '11b5f6e4ece2870ae3fbf325df2f4b6439e843071461d45843c8382906e90dc8'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.5.1/mdschema_0.5.1_linux_arm64.tar.gz'
      sha256 '9f94bbb1fb3aa5614d7f6c57136c2f47fe144e3f062980828c6baf28e9bfc927'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.5.1/mdschema_0.5.1_linux_amd64.tar.gz'
      sha256 '447f9f9602690cdb8fc466251d8449341220232ea2dc946f3232f926ff21b024'
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
