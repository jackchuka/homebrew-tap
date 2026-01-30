class Mdschema < Formula
  desc '📝 A declarative schema-based Markdown validator that helps maintain consistent documentation structure across projects.'
  version '0.8.0'
  homepage 'https://github.com/jackchuka/mdschema'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.8.0/mdschema_0.8.0_darwin_arm64.tar.gz'
      sha256 '55c28d59eb92d9ffc12a1820637c05e1cb8235dd19ae3a689046ac6b3098f651'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.8.0/mdschema_0.8.0_darwin_amd64.tar.gz'
      sha256 '249071f3de48a4932a7532d8a996cd2c6259e08c8e1b52ade61650d3d84e90b4'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.8.0/mdschema_0.8.0_linux_arm64.tar.gz'
      sha256 '5259b83475295144e0de0d5307bb6d780992d0940576789f9feab979211b2ffe'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.8.0/mdschema_0.8.0_linux_amd64.tar.gz'
      sha256 'cce791909959e128a4849fe63d8be62c13363f18a4bef94e5e8dc7d44649b1e8'
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
