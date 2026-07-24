class Mdschema < Formula
  desc '📝 A declarative schema-based Markdown validator that helps maintain consistent documentation structure across projects.'
  version '0.14.0'
  homepage 'https://github.com/jackchuka/mdschema'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.14.0/mdschema_0.14.0_darwin_arm64.tar.gz'
      sha256 'beccb7cff4a807fdcbe0beae2d7988f7b0877dc0ac41edcc393f8ced21a102c7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.14.0/mdschema_0.14.0_darwin_amd64.tar.gz'
      sha256 '03573595a5d0edee58d70f218662f91ae71fd940b4e27c773b015fc114e26b46'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.14.0/mdschema_0.14.0_linux_arm64.tar.gz'
      sha256 '40b57606ca133128c79d0810a856e9e8a5bd35b4cc04bc28b5fbc5a6879e3a88'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/mdschema/releases/download/v0.14.0/mdschema_0.14.0_linux_amd64.tar.gz'
      sha256 '3cb421b18109f14d2b95b6212d69ab56862b4e39061316997a80a90618758eb2'
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
