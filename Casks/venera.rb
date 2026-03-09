cask "venera" do
  version "1.6.3,163"
  sha256 "f814fc4ae2d60a3abdb4e08de22e2cce49d2f63e8fdac842c93a2c9eae3425b3"

  url "https://github.com/venera-app/venera/releases/download/v#{version.csv.first}/venera-#{version.csv.first}+#{version.csv.second}.dmg"
  name "Venera"
  desc "Comic reader that supports reading local and network comics"
  homepage "https://github.com/venera-app/venera"

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

  app "Venera.app"

  zap trash: "~/Library/Containers/com.github.wgh136.venera"
end
