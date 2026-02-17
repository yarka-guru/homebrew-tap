class RdsSsmConnect < Formula
  desc "Secure database tunneling via AWS SSM"
  homepage "https://github.com/yarka-guru/connection_app"
  version "1.8.2"
  license "MIT"

  on_linux do
    on_intel do
      url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/RDS.SSM.Connect_#{version}_amd64.deb"
      sha256 "56fe86a3002aec6a0e4edd8c70b26ff63d4a26072fbb65034188776859d32a14"
    end
    on_arm do
      url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/RDS.SSM.Connect_#{version}_arm64.deb"
      sha256 "c5b27697b8b6ffb5ec0cd9e4a73f25c81085052a4d28d60e36019e7971a45f9e"
    end
  end

  depends_on "awscli"
  depends_on "aws-vault"

  def install
    system "ar", "x", cached_download
    mkdir_p "extract"
    system "tar", "xf", Dir["data.tar.*"].first, "-C", "extract"

    bin.install Dir["extract/usr/bin/*"]
    share.install Dir["extract/usr/share/*"] if Dir.exist?("extract/usr/share")
  end

  def caveats
    <<~EOS
      You also need the AWS Session Manager Plugin:
        https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html

      Ensure your AWS profiles are configured in ~/.aws/config

      On macOS, install the desktop app instead:
        brew install --cask rds-ssm-connect
    EOS
  end
end
