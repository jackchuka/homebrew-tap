cask "timestack" do
  version "0.3.25"

  on_arm do
    sha256 "375d86d071e88ab8a5ff809029f8facd7c327ed84f15d165a0a8695d157b5e8e"

    url "https://github.com/jackchuka/timestack/releases/download/v#{version}/timestack_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "f44cb096ceb0dad0522d7b7dce808a862596a536476ea59ea57d2d16cf3e903b"

    url "https://github.com/jackchuka/timestack/releases/download/v#{version}/timestack_#{version}_x64.dmg"
  end

  name "Timestack"
  desc "Timestack is a countdown timer that nests. Define your agenda as a tree of timed segments"
  homepage "https://github.com/jackchuka/timestack"

  app "timestack.app"

  zap trash: [
    "~/Library/Preferences/com.jackchuka.timestack.plist",
    "~/Library/WebKit/com.jackchuka.timestack",
  ]

  caveats <<~EOS
    #{token} is not signed with an Apple Developer ID.
    If macOS says the app is damaged, run:
      xattr -cr /Applications/timestack.app
  EOS
end
