cask "rds-ssm-connect" do
  version "1.7.3"
  sha256 "fc6ac505a903db9ab61e6dc436d884c8667721e8b44f1c7d01cedc8d41b46aba"

  url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/RDS.SSM.Connect_#{version}_aarch64.dmg"
  name "RDS SSM Connect"
  desc "Secure database tunneling via AWS SSM"
  homepage "https://github.com/yarka-guru/connection_app"

  depends_on macos: ">= :monterey"

  app "RDS SSM Connect.app"

  zap trash: [
    "~/Library/Application Support/com.rds-ssm-connect.desktop",
    "~/Library/Caches/com.rds-ssm-connect.desktop",
  ]
end
