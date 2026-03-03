class RdsSsmConnect < Formula
  desc "Secure database tunneling via AWS SSM"
  homepage "https://github.com/yarka-guru/connection_app"
  version "2.1.1"
  license "MIT"

  on_linux do
    on_intel do
      url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/RDS.SSM.Connect_#{version}_amd64.deb"
      sha256 "616981b132441bc8e3dfbbcb638a98a477f36543fab0ce639d8cf90989fd73de"
    end
    on_arm do
      url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/RDS.SSM.Connect_#{version}_arm64.deb"
      sha256 "2d5cea4dc8bee093270668c449099116e276948bf928124fc057ac6373762d7f"
    end
  end

  def install
    system "ar", "x", cached_download
    mkdir_p "extract"
    system "tar", "xf", Dir["data.tar.*"].first, "-C", "extract"

    bin.install Dir["extract/usr/bin/*"]
    share.install Dir["extract/usr/share/*"] if Dir.exist?("extract/usr/share")
  end

  def caveats
    <<~EOS
      Ensure your AWS profiles are configured in ~/.aws/config

      On macOS, install the desktop app instead:
        brew install --cask rds-ssm-connect
    EOS
  end
end
