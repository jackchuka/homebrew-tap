cask "timestack" do
  version "0.3.16"

  on_arm do
    sha256 "4cb053afd29f081d462f4a700a3ec168275524084c6abf8f949d7678d97b1afe"

    url "https://github.com/jackchuka/timestack/releases/download/v#{version}/timestack_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "98df0381ab929f78cbedcb97b3a57fb84e228fe7865e7ab8a431acb549755533"

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
