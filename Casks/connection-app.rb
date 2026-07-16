cask "connection-app" do
  version "3.7.5"

  on_arm do
    sha256 "b5f544ac0c3ec7bbec190e58077777b1eeab48aaa117df9c60286c2b8f5eccdd"
    url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/ConnectionApp_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "1447b678ed682f17df3769ed7ec172064f26bcb14f44db66f67f7496b9c206af"
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
