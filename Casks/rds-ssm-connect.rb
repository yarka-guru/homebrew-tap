cask "rds-ssm-connect" do
  version "1.8.6"

  on_arm do
    sha256 "89725b82d898b1a7f0e433915f785e9eeb906a893fbb12dac2c6b9b0299e6e71"
    url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/RDS.SSM.Connect_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "c91219eea991820cb61e9a9772110df4d75d7505e38a830b8fa086b8e1814e7a"
    url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/RDS.SSM.Connect_#{version}_x64.dmg"
  end

  name "RDS SSM Connect"
  desc "Secure database tunneling via AWS SSM"
  homepage "https://github.com/yarka-guru/connection_app"

  depends_on macos: ">= :monterey"
  depends_on formula: "aws-vault"
  depends_on formula: "awscli"

  app "RDS SSM Connect.app"

  caveats <<~EOS
    You also need the AWS Session Manager Plugin:
      brew install --cask session-manager-plugin

    Ensure your AWS profiles are configured in ~/.aws/config
  EOS

  zap trash: [
    "~/Library/Application Support/com.rds-ssm-connect.desktop",
    "~/Library/Caches/com.rds-ssm-connect.desktop",
  ]
end
