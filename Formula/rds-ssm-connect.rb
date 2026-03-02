class RdsSsmConnect < Formula
  desc "Secure database tunneling via AWS SSM"
  homepage "https://github.com/yarka-guru/connection_app"
  version "2.0.1"
  license "MIT"

  on_linux do
    on_intel do
      url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/RDS.SSM.Connect_#{version}_amd64.deb"
      sha256 "481a85f5ed0ea32f4d41d93c833011640822be1a536efc999431e33d7bc9ac74"
    end
    on_arm do
      url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/RDS.SSM.Connect_#{version}_arm64.deb"
      sha256 "5c670c1557b0d3221ea353d4f4ac65e6138ecd99b34dbb188582cd8079c6c5b4"
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
