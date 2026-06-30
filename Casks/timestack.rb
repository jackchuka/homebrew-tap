cask "timestack" do
  version "0.3.10"

  on_arm do
    sha256 "5fc3fb2fe91baa7247f6e80b2204632f84593ad878cdc149ae8790555b1182e5"

    url "https://github.com/jackchuka/timestack/releases/download/v#{version}/timestack_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "f39c98650ac57ca20691ba351904d3d0224b5342f08f896f489f3fc9034fa1fd"

    url "https://github.com/jackchuka/timestack/releases/download/v#{version}/timestack_#{version}_x64.dmg"
  end

  name "Timestack"
  desc "Time, in layers. A countdown timer that nests"
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
