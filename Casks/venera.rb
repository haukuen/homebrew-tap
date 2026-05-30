cask "venera" do
  version "1.12.0,203"
  sha256 "d8ac0e4e2f048a9ac234737e3ee21c08221b1112fab36a2e23d6399e6d6b5deb"

  url "https://github.com/haukuen/venera/releases/download/v#{version.csv.first}/venera-#{version.csv.first}+#{version.csv.second}.dmg"
  name "Venera"
  desc "Comic reader that supports reading local and network comics"
  homepage "https://github.com/haukuen/venera"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest do |json, regex|
      match = json["tag_name"]&.match(regex)
      next if match.nil?

      asset_regex = /^venera-#{Regexp.escape(match[1])}\+(\d+)\.dmg$/i
      asset = json["assets"]&.find { |item| item["name"]&.match?(asset_regex) }
      asset_match = asset&.fetch("name", nil)&.match(asset_regex)
      next if asset_match.nil?

      "#{match[1]},#{asset_match[1]}"
    end
  end

  depends_on :macos

  app "Venera.app"

  zap trash: [
    "~/Library/Application Scripts/io.github.haukuen.venera",
    "~/Library/Application Support/io.github.haukuen.venera",
    "~/Library/Caches/io.github.haukuen.venera",
    "~/Library/Containers/io.github.haukuen.venera",
  ]
end
