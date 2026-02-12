cask "rds-ssm-connect" do
  version "1.7.17"

  on_arm do
    sha256 "b60c1f26ef6a5c54a84cb2229ef9da74d9295f276766f44113bf956f215f7231"
    url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/RDS.SSM.Connect_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "83cf253bde29e07506057614c5419453815b15128ab6ed3a783918607404878b"
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
