class Tfpacker < Formula
  desc '🧩 A Terraform file packer that organizes resource, module, data, and variable blocks into clean, rule-based .tf files. 💡 Supports custom grouping by type, name prefix, or both — with optional YAML config.'
  version '0.2.10'
  homepage 'https://github.com/jackchuka/tfpacker'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.10/tfpacker_0.2.10_darwin_arm64.tar.gz'
      sha256 'ac35fee156a4cbe142f0bc508ddcea1f1ff5bea2315ceac5da3756ffd26c571a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.10/tfpacker_0.2.10_darwin_amd64.tar.gz'
      sha256 '5bc58646126429a0235f4ebc975aff0e076f0a1b5e584ab64f71a99cb7015f9c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.10/tfpacker_0.2.10_linux_arm64.tar.gz'
      sha256 'df8f98f3a5fcbf561c41bec32bac8e3722c2eef5f2e2963b85e6e3ba67c91a06'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/tfpacker/releases/download/v0.2.10/tfpacker_0.2.10_linux_amd64.tar.gz'
      sha256 '3bf6c0a4882ad54a6ca38792c19b97207d5dfe815a01039c7b24f8085ccd9f00'
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
