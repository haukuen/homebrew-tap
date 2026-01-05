cask "venera" do
  version "1.6.2"
  sha256 "ce07523d0faf58f6dea45a5d5e0c5b26fa6e3d614e2cbcea6d1e468861f7a593"

  url "https://github.com/venera-app/venera/releases/download/v#{version}/venera-#{version}+162.dmg",
      verified: "github.com/venera-app/venera/"
  name "Venera"
  desc "A comic reader that supports reading local and network comics"
  homepage "https://github.com/venera-app/venera"

  app "Venera.app"

  zap trash: [
    "~/.local/share/venera",
    "~/Library/Preferences/com.venera.app.plist",
    "~/Library/Saved Application State/com.venera.app.savedState",
  ]
end
