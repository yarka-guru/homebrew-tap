class ConnectionApp < Formula
  desc "Secure tunneling via AWS SSM"
  homepage "https://github.com/yarka-guru/connection_app"
  version "3.7.1"
  license "MIT"

  depends_on "yarka-guru/tap/connection-app-cli"

  on_linux do
    on_intel do
      url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/ConnectionApp_#{version}_amd64.deb"
      sha256 "68999d70287acbceee3edf2048ab82bb22db378728d198568a9c87b0ac6bc251"
    end
    on_arm do
      url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/ConnectionApp_#{version}_arm64.deb"
      sha256 "bd99fe6dd7fc0b846a91f0c8aa4dacb435e9cecc946be32ec6184d40fdff8a92"
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
    desktop_file = desktop_dir/"connection-app.desktop"
    desktop_file.unlink if desktop_file.exist?
    desktop_file.write <<~DESKTOP
      [Desktop Entry]
      Name=ConnectionApp
      Comment=Secure tunneling via AWS SSM
      Exec=#{bin}/connection-app
      Icon=#{share}/icons/hicolor/128x128/apps/connection-app.png
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
    desktop_file = Pathname.new(File.expand_path("~/.local/share/applications/connection-app.desktop"))
    desktop_file.unlink if desktop_file.exist?

    icon_base = Pathname.new(File.expand_path("~/.local/share/icons/hicolor"))
    Pathname.glob(icon_base/"*/apps/connection-app.png").each(&:unlink)
  end

  def caveats
    <<~EOS
      Ensure your AWS profiles are configured in ~/.aws/config

      On macOS, install the desktop app instead:
        brew install --cask connection-app
    EOS
  end
end
