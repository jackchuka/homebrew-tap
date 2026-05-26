cask "timestack" do
  version "0.3.5"

  on_arm do
    sha256 "b1fc81a9d3346ef5b9b1270e34baeebc520d7c02d7a1c3ef28bf74e9606ecf1d"

    url "https://github.com/jackchuka/timestack/releases/download/v#{version}/timestack_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "a997554cd5d3cac5308827b99d5b7e77e7c211378a6ac8c0619eb859cb0caa8c"

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
