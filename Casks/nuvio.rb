cask "nuvio" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.18-alpha"
  sha256 :no_check # alpha app, frequent releases + self-updates; not pinning a checksum

  url "https://github.com/NuvioMedia/NuvioDesktop/releases/download/#{version}/Nuvio-macOS-#{arch}-#{version}.dmg",
      verified: "github.com/NuvioMedia/NuvioDesktop/"
  name "Nuvio"
  desc "Media streaming desktop app (alpha)"
  homepage "https://github.com/NuvioMedia/NuvioDesktop"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "Nuvio.app"

  zap trash: [
    "~/Library/Application Support/nuvio-desktop",
    "~/Library/Preferences/com.nuvio.media.desktop.plist",
    "~/Library/Saved Application State/com.nuvio.media.desktop.savedState",
  ]
end
