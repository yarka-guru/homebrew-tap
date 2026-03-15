cask "connection-app" do
  version "3.1.0"

  on_arm do
    sha256 "606700a159c95ee6c36f345db280d2775c69e6dd4f132c339602674d641abf8d"
    url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/ConnectionApp_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "846ea06b7f6373cabf07757d5d499acf27ceb7181192fb362e5dd0c75ccda681"
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
