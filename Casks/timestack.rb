cask "timestack" do
  version "0.3.27"

  on_arm do
    sha256 "10a047727c9a30487ee0c689fe6217f1df9f517381ff39d9cc2d55ec440e2351"

    url "https://github.com/jackchuka/timestack/releases/download/v#{version}/timestack_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "965306f085f9e7d47e22a09ebd6d5dbf50fb713edda35757c098bcdc5835685b"

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
