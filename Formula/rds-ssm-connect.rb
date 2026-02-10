class RdsSsmConnect < Formula
  desc "Secure database tunneling via AWS SSM"
  homepage "https://github.com/yarka-guru/connection_app"
  version "1.7.3"
  license "MIT"

  on_linux do
    on_intel do
      url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/RDS.SSM.Connect_#{version}_amd64.deb"
      sha256 "2e364f5ddb8953b3656696d8d06bc82719f0ef8ee5fbf59532455d43ca090723"
    end

    on_arm do
      url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/RDS.SSM.Connect_#{version}_aarch64.deb"
      sha256 :no_check
    end
  end

  def install
    # Extract .deb package
    system "ar", "x", cached_download
    mkdir_p "extract"
    system "tar", "xf", Dir["data.tar.*"].first, "-C", "extract"

    # Install binary
    bin.install Dir["extract/usr/bin/*"]

    # Install desktop file and icons if present
    share.install Dir["extract/usr/share/*"] if Dir.exist?("extract/usr/share")
  end

  def caveats
    <<~EOS
      On macOS, install the desktop app instead:
        brew install --cask rds-ssm-connect
    EOS
  end
end
