cask "timestack" do
  version "0.3.13"

  on_arm do
    sha256 "35e4f42f622ca66235166c027ef79279d310f3532e6b798dab01d20c57b660bb"

    url "https://github.com/jackchuka/timestack/releases/download/v#{version}/timestack_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "ba2b933f7bc8fbf0369af37fb42607e7b040a2cfdb8f1888ec3b9bad7207d09d"

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
