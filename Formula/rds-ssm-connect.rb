class RdsSsmConnect < Formula
  desc "Secure database tunneling via AWS SSM"
  homepage "https://github.com/yarka-guru/connection_app"
  version "1.8.3"
  license "MIT"

  on_linux do
    on_intel do
      url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/RDS.SSM.Connect_#{version}_amd64.deb"
      sha256 "590a430aac9e9df0308c703aebb7ef4e236cacd6f3747c7efef2e2958077d9a2"
    end
    on_arm do
      url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/RDS.SSM.Connect_#{version}_arm64.deb"
      sha256 "868081c8a712d3b944b3df659a1d1cf8d8919df916a90b8e3572d0bb0634f53a"
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
