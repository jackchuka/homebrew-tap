cask "timestack" do
  version "0.3.24"

  on_arm do
    sha256 "286d2f55aca33169ce23bcc471eb6518857ae05d351a9033f684813528a77611"

    url "https://github.com/jackchuka/timestack/releases/download/v#{version}/timestack_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "8cce411c2d8e7f4b89fed3e1573c91fbffd7976acfadc26b073013395ba7fb0d"

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
