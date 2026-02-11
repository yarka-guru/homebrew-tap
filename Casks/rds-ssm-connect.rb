cask "rds-ssm-connect" do
  version "1.7.14"

  on_arm do
    sha256 "21d734a9c55203eaf615ad1a5f51a29e7046bbe8131ac84cb6ca1ffb35e89366"
    url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/RDS.SSM.Connect_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "3ac06a30a1bdd3bc546e7e445134f1541b5726596590c2b0de6efb0996093e10"
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
