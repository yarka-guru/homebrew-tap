cask "connection-app" do
  version "3.4.4"

  on_arm do
    sha256 "fb798c2b7c01b6008dc4d213aa18926d41cfc8e78dd74b0011f4074e5037775e"
    url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/ConnectionApp_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "bc4f2feee230cba8bfec415a9e2fb32474dc57c60fadf1f94002f07fa078f51f"
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
