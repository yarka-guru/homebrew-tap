cask "connection-app" do
  version "3.2.2"

  on_arm do
    sha256 "8418efa71c5d9725d948b568b54befc82a35e34d3ee89b12ef171d8fb1cb03de"
    url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/ConnectionApp_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "fdb045c1b68934353631e40d79496ba4cbc1ddd6f16211d1b4674fe9a3810297"
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
