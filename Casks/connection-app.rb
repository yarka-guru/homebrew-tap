cask "connection-app" do
  version "3.7.0"

  on_arm do
    sha256 "17e22d2af02f5e2f7c3c48cbdc43f29b4dd7990808bce587b9fbfb14accd712a"
    url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/ConnectionApp_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "8d915d32ea6fa8dbd8f98b793bd87e745bb11f293d9620591b766b17b40b8c27"
    url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/ConnectionApp_#{version}_x64.dmg"
  end

  name "ConnectionApp"
  desc "Secure tunneling via AWS SSM"
  homepage "https://github.com/yarka-guru/connection_app"

  depends_on macos: :monterey
  depends_on formula: "yarka-guru/tap/connection-app-cli"

  app "ConnectionApp.app"

  caveats <<~EOS
    Ensure your AWS profiles are configured in ~/.aws/config
    The companion CLI is installed as: connection-app-cli
  EOS

  zap trash: [
    "~/Library/Application Support/com.connection-app.desktop",
    "~/Library/Caches/com.connection-app.desktop",
  ]
end
