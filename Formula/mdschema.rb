class Mdschema < Formula
  desc '📝 A declarative schema-based Markdown validator that helps maintain consistent documentation structure across projects.'
  version '0.15.2'
  homepage 'https://github.com/jackchuka/mdschema'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.15.2/mdschema_0.15.2_darwin_arm64.tar.gz'
      sha256 '572e48d6e1f5fffc724b13c989353a8213f36c40a3de3963a82ab3a244891672'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.15.2/mdschema_0.15.2_darwin_amd64.tar.gz'
      sha256 'f0cfdb6ad74769f24aacffbc790968154439e7b303ebe207e038fa21f1d72a9d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.15.2/mdschema_0.15.2_linux_arm64.tar.gz'
      sha256 'dae16bc35ee4e27226d41105449b62d167fa36089c1b151be11545de016b8f9e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.15.2/mdschema_0.15.2_linux_amd64.tar.gz'
      sha256 'e5614029a6dceaeeeb6e18ab2fffced6df8b0bd11f9f9dfb9c8b40b917d4fba3'
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
