cask "rds-ssm-connect" do
  version "1.7.4"

  on_arm do
    sha256 "d94cc93ba8793f9196c3ca40234ba7814d8eacae966f48e27db057b0367eb37a"
    url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/RDS.SSM.Connect_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "3c3a3dd39fb3b19605ed722d7795dba12b1b29cf5e39664d18f00836ed1093ac"
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
