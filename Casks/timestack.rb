cask "timestack" do
  version "0.3.26"

  on_arm do
    sha256 "662e5e500b4342b8bd1255a75e0ad5aad1760184e985b6c694d2db1c2661dd34"

    url "https://github.com/jackchuka/timestack/releases/download/v#{version}/timestack_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "54cf4b7655f394f7dcf4db3bd11e9eef088e45a242934546041a59943dc777a5"

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
