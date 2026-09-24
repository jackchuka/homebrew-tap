class Tfpacker < Formula
  desc '🧩 A Terraform file packer that organizes resource, module, data, and variable blocks into clean, rule-based .tf files. 💡 Supports custom grouping by type, name prefix, or both — with optional YAML config.'
  version '0.2.13'
  homepage 'https://github.com/jackchuka/tfpacker'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.13/tfpacker_0.2.13_darwin_arm64.tar.gz'
      sha256 '69c997f8b4c5737a0332990b87f476186101b853ebc94d9116101d3ffd362ed5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.13/tfpacker_0.2.13_darwin_amd64.tar.gz'
      sha256 'bd178adfe8257dcff43363092bc8fa25cb1629ebddbdce50cf32ab03ecc37fc5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.13/tfpacker_0.2.13_linux_arm64.tar.gz'
      sha256 'f476bd291e94b3ad9b9e2ce9cad59a21205315edbd06bcf7eb02c04a403a9c2c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.13/tfpacker_0.2.13_linux_amd64.tar.gz'
      sha256 '09e963ee971570a12c40e64f0d2f48b05d599a5b3990c2a1f0f23aa54c1f378c'
    end
  end

  head do
    url 'https://github.com/jackchuka/tfpacker.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tfpacker'
  end
end
