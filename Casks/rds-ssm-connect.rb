cask "rds-ssm-connect" do
  version "1.7.3"

  on_arm do
    sha256 "8addc93625006ebbfa9734f8cf2425f61ece458056f66a0302b31995d6b69206"
    url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/RDS.SSM.Connect_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "da7a0559faedd4c7956d242f2021d6a112b66f623a303f527670bf45bcceb674"
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
