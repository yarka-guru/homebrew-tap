cask "connection-app" do
  version "3.7.8"

  on_arm do
    sha256 "d2841ab936e82f44d057e5b6179ba42f1a144bbabd840e345db4649677c10472"
    url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/ConnectionApp_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "9e4e9c81a908ba5d2a24e087c2767ced507c0d09536d2605f9203c0086ba30c3"
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
