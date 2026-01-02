class PokerRs < Formula
  desc '🃏 High-performance poker hand evaluation library written in Rust with a Ratatui TUI for playing No-Limit Texas Hold\'em.'
  version '0.1.0'
  homepage 'https://github.com/jackchuka/poker-rs'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/jackchuka/poker-rs/releases/download/v0.1.0/poker-rs_0.1.0_darwin_arm64.tar.gz'
      sha256 '775b105f129544912f2df562b908948b0ccfca405136055b69e37e8261650896'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/poker-rs/releases/download/v0.1.0/poker-rs_0.1.0_darwin_amd64.tar.gz'
      sha256 '9b25daf94ffc218c8e36005e1305b006d58709ff739bddafa43c6ce06125dbd7'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/jackchuka/poker-rs/releases/download/v0.1.0/poker-rs_0.1.0_linux_amd64.tar.gz'
      sha256 'b8fe0f5ea68ba858df754ab384c08065235525594a8c7d77aabec26928b58665'
    end
  end

  head do
    url 'https://github.com/jackchuka/poker-rs.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'poker-rs'
  end
end
