cask "connection-app" do
  version "3.2.3"

  on_arm do
    sha256 "b788cb2616016a30d7df8faef12be9ef4da007f8f969fba0282f6a3df7e53f18"
    url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/ConnectionApp_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "f6d08082e71047f78e07c795068cc63a02c7ed078cf8c4955c5feadf9ecd8c98"
    url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/ConnectionApp_#{version}_x64.dmg"
  end

  name "ConnectionApp"
  desc "Secure tunneling via AWS SSM"
  homepage "https://github.com/yarka-guru/connection_app"

  depends_on macos: ">= :monterey"

  app "ConnectionApp.app"

  caveats <<~EOS
    Ensure your AWS profiles are configured in ~/.aws/config
  EOS

  zap trash: [
    "~/Library/Application Support/com.connection-app.desktop",
    "~/Library/Caches/com.connection-app.desktop",
  ]
end
