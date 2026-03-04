class RdsSsmConnect < Formula
  desc "Secure database tunneling via AWS SSM"
  homepage "https://github.com/yarka-guru/connection_app"
  version "2.1.8"
  license "MIT"

  on_linux do
    on_intel do
      url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/RDS.SSM.Connect_#{version}_amd64.deb"
      sha256 "768f275186f85deb9ebd75fbfea5ae68226c08458e00341b0b9695709e558156"
    end
    on_arm do
      url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/RDS.SSM.Connect_#{version}_arm64.deb"
      sha256 "3bfac369564aed3c20099465edfbf2c627ab4622c731506582a634c4f5a75a63"
    end
  end

  def install
    system "ar", "x", cached_download
    mkdir_p "extract"
    system "tar", "xf", Dir["data.tar.*"].first, "-C", "extract"

    bin.install Dir["extract/usr/bin/*"]
    share.install Dir["extract/usr/share/*"] if Dir.exist?("extract/usr/share")
  end

  def post_install
    # Generate .desktop file with correct Homebrew paths
    desktop_dir = Pathname.new(File.expand_path("~/.local/share/applications"))
    desktop_dir.mkpath
    desktop_file = desktop_dir/"rds-ssm-connect.desktop"
    desktop_file.unlink if desktop_file.exist?
    desktop_file.write <<~DESKTOP
      [Desktop Entry]
      Name=RDS SSM Connect
      Comment=Secure database tunneling via AWS SSM
      Exec=#{bin}/rds-ssm-connect
      Icon=#{share}/icons/hicolor/128x128/apps/rds-ssm-connect.png
      Type=Application
      Categories=Development;Network;
      Terminal=false
    DESKTOP

    # Copy icons to user icon directory
    icon_src = share/"icons/hicolor"
    if icon_src.exist?
      icon_dest = Pathname.new(File.expand_path("~/.local/share/icons/hicolor"))
      icon_src.glob("*/apps/*.png").each do |icon|
        size_dir = icon_dest/icon.parent.parent.basename/"apps"
        size_dir.mkpath
        dest_icon = size_dir/icon.basename
        dest_icon.unlink if dest_icon.exist?
        cp icon, dest_icon
      end
    end
  end

  def post_uninstall
    desktop_file = Pathname.new(File.expand_path("~/.local/share/applications/rds-ssm-connect.desktop"))
    desktop_file.unlink if desktop_file.exist?

    icon_base = Pathname.new(File.expand_path("~/.local/share/icons/hicolor"))
    Pathname.glob(icon_base/"*/apps/rds-ssm-connect.png").each(&:unlink)
  end

  def caveats
    <<~EOS
      Ensure your AWS profiles are configured in ~/.aws/config

      On macOS, install the desktop app instead:
        brew install --cask rds-ssm-connect
    EOS
  end
end
