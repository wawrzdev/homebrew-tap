cask "graphite" do
  version "0.2.2"
  # Graphite ships an electron-updater latest-mac.yml with sha512 only; casks need sha256, so this
  # is computed from the universal DMG. The auto-bump bot recomputes it on each version bump.
  sha256 "cccec445d5034928e887e57021cbf224ed43ed5e0eacb1f085b229687a57eb8b"

  url "https://system-tray-app-releases-prod.s3.us-west-2.amazonaws.com/Graphite-#{version}-universal.dmg",
      verified: "system-tray-app-releases-prod.s3.us-west-2.amazonaws.com/"
  name "Graphite"
  desc "Menu bar app for Graphite stacked-PR workflow"
  homepage "https://graphite.dev/docs/menu-bar-app"

  livecheck do
    url "https://system-tray-app-releases-prod.s3.us-west-2.amazonaws.com/latest-mac.yml"
    strategy :electron_builder
  end

  auto_updates true

  app "Graphite.app"

  zap trash: [
    "~/Library/Application Support/@withgraphitesystem-tray-app-updater",
    "~/Library/Preferences/com.electron.withgraphite.plist",
    "~/Library/Saved Application State/com.electron.withgraphite.savedState",
  ]
end
