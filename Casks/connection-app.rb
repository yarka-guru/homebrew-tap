cask "connection-app" do
  version "3.7.3"

  on_arm do
    sha256 "34dec552752972baa880046d27065dc2dd901cea24b5bd06166baa7700a2b00a"
    url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/ConnectionApp_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "6388a8ac6894a209b9b5662e968619a29224ad37949a3a4296611f30a3c877cf"
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
