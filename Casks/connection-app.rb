cask "connection-app" do
  version "3.9.0"

  on_arm do
    sha256 "4683feb6788f6792d9595827281523f16276f747a4d698a020403a34d2c98504"
    url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/ConnectionApp_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "3b4906a727c716b2438a77a46cf39986d3b488ad15977ef4ab43d2b4f42e2484"
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
