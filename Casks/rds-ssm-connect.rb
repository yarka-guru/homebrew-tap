cask "rds-ssm-connect" do
  version "2.1.1"

  on_arm do
    sha256 "2e428bfdea12bd7b4756df4ed79f0eb75843efa166cb5989287a3a95f6929a69"
    url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/RDS.SSM.Connect_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "c5e9727129db61fbb296c2463cf06cdf3e2e24bc6a16bb59408ba5a1a53fc2b0"
    url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/RDS.SSM.Connect_#{version}_x64.dmg"
  end

  name "RDS SSM Connect"
  desc "Secure database tunneling via AWS SSM"
  homepage "https://github.com/yarka-guru/connection_app"

  depends_on macos: ">= :monterey"

  app "RDS SSM Connect.app"

  caveats <<~EOS
    Ensure your AWS profiles are configured in ~/.aws/config
  EOS

  zap trash: [
    "~/Library/Application Support/com.rds-ssm-connect.desktop",
    "~/Library/Caches/com.rds-ssm-connect.desktop",
  ]
end
