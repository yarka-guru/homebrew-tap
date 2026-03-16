class ConnectionApp < Formula
  desc "Secure tunneling via AWS SSM"
  homepage "https://github.com/yarka-guru/connection_app"
  version "3.2.2"
  license "MIT"

  on_linux do
    on_intel do
      url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/ConnectionApp_#{version}_amd64.deb"
      sha256 "51f73a359139df6b0dacc178951d66b6e11030225149e6de8001fbf8a8dc58be"
    end
    on_arm do
      url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/ConnectionApp_#{version}_arm64.deb"
      sha256 "b03915d5f4d582d860c9df97bb1de0268eb359222b5746795242874ffe25b8a9"
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
