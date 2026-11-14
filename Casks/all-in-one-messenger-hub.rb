cask "all-in-one-messenger-hub" do
  version "1.1.62"
  sha256 "604b4769d372a7f8d2e60ae1a38f670593c7ceccdf301043da3b1014e6f61fc0"

  url "https://github.com/doonfrs/all-in-one-messenger-hub-releases/releases/download/v#{version}/AllInOneMessengerHub.dmg",
      verified: "github.com/doonfrs/all-in-one-messenger-hub-releases/"
  name "All-in-One Messenger Hub"
  name "One Messenger Hub"
  desc "WhatsApp, Telegram, Messenger and more in one window, with multiple accounts"
  homepage "https://onemessengerhub.com/"

  # Not every release carries a DMG (some are Windows only), so pick the newest one that does.
  livecheck do
    url "https://api.github.com/repos/doonfrs/all-in-one-messenger-hub-releases/releases"
    strategy :json do |json|
      json.select do |release|
        !release["draft"] && !release["prerelease"] &&
          release["assets"]&.any? { |asset| asset["name"] == "AllInOneMessengerHub.dmg" }
      end.map { |release| release["tag_name"]&.delete_prefix("v") }
    end
  end

  depends_on macos: ">= :monterey"

  app "All-in-One Messenger Hub.app"

  zap trash: [
    "~/Library/Application Support/com.trinavo.allInOneMessengerHub",
    "~/Library/Caches/com.trinavo.allInOneMessengerHub",
    "~/Library/HTTPStorages/com.trinavo.allInOneMessengerHub",
    "~/Library/Preferences/com.trinavo.allInOneMessengerHub.plist",
    "~/Library/Saved Application State/com.trinavo.allInOneMessengerHub.savedState",
    "~/Library/WebKit/com.trinavo.allInOneMessengerHub",
  ]
end
