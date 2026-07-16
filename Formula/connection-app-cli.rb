class ConnectionAppCli < Formula
  desc "ConnectionApp CLI — secure tunneling via AWS SSM"
  homepage "https://github.com/yarka-guru/connection_app"
  version "3.7.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/connection-app-cli-aarch64-apple-darwin.tar.gz"
      sha256 "86722b9eb90b4d9ad1eb1b5e01796827937adc669d01ef49709354140290d446"
    end
    on_intel do
      url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/connection-app-cli-x86_64-apple-darwin.tar.gz"
      sha256 "71c73d9ee8e6713963ae4331e435370c4df5f73722db585c362b07fa0b366c94"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/connection-app-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "673b1d30f39cdefec309d142f4adc2c6fec07c660951a237b1464fcf65ea444b"
    end
    on_intel do
      url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/connection-app-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5f05d1c42ecb1a588b76caae3848eedbcef76ee8a5154751780be59ba7cd0ef1"
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
