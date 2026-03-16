cask "connection-app" do
  version "3.2.0"

  on_arm do
    sha256 "07c3a0f7f74855f0a438ade54c57a1e8bcd47f151eca5d4086a68bc1bc277230"
    url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/ConnectionApp_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "d829a573f4dc98b3ba2178fe6782499e7e7ed170456ca98f8a3de99e3a5d21c7"
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
