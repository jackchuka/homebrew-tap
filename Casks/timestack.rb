cask "timestack" do
  version "0.3.28"

  on_arm do
    sha256 "99727a0b5f1e86519e01239f18c995b5d75772e948cb7039b43bcaf68be4a518"

    url "https://github.com/jackchuka/timestack/releases/download/v#{version}/timestack_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "053d4e666eccb5d1cde78e2aa5fad9a2255bc19790f4874c2fe5460938501be8"

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
