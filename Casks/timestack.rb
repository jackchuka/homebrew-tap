cask "timestack" do
  version "0.3.17"

  on_arm do
    sha256 "716dbcd8b8bb53a9bc6c197545452a16f062d7623afdd47ca8e7fc7677cb2d1e"

    url "https://github.com/jackchuka/timestack/releases/download/v#{version}/timestack_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "f92d43be8b2e9ec3b781f42ec3ac1f0cf9ba23d188ec1aa26801b7e909472df3"

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
