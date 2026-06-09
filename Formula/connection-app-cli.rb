class ConnectionAppCli < Formula
  desc "ConnectionApp CLI — secure tunneling via AWS SSM"
  homepage "https://github.com/yarka-guru/connection_app"
  version "3.6.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/connection-app-cli-aarch64-apple-darwin.tar.gz"
      sha256 "ebd25c7f851305ebe8f82cb40e52549c47ef6390b906e86858ff583ccd0543e3"
    end
    on_intel do
      url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/connection-app-cli-x86_64-apple-darwin.tar.gz"
      sha256 "94f9a939fc34e9f9f957b0ca9978a6bb6924343512d80533002780c3932c6e09"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/connection-app-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2fe580c4d0fdf85c1c76dc9e1f8dd28fc42358a9f427fb15e8f2eafa9173c1c6"
    end
    on_intel do
      url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/connection-app-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4c0e1d21b84c014a31754af78c16447d355f6fd5080cff4e33c4e6138ea4bb77"
    end
  end

  def install
    bin.install "connection-app-cli"
  end

  def caveats
    <<~EOS
      Ensure your AWS profiles are configured in ~/.aws/config
    EOS
  end

  test do
    assert_match "connection-app", shell_output("#{bin}/connection-app-cli --version")
  end
end
