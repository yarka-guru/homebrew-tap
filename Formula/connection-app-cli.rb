class ConnectionAppCli < Formula
  desc "ConnectionApp CLI — secure tunneling via AWS SSM"
  homepage "https://github.com/yarka-guru/connection_app"
  version "3.9.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/connection-app-cli-aarch64-apple-darwin.tar.gz"
      sha256 "9933ee3b53098fd2f627fcbdd5dff04c7a0f9eb49b541fd3cdd4a9fd4eb155f2"
    end
    on_intel do
      url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/connection-app-cli-x86_64-apple-darwin.tar.gz"
      sha256 "2b0bcfe1386c078602824343f65aa324f7c58088a54247b9d616ad4261613eac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/connection-app-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3e29cca3209dadf05232c0444523f975b4e64c8a939e6cd981f05dbd28db1409"
    end
    on_intel do
      url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/connection-app-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d5e669ee0a6907b5515f180b390d275a3f1fb56ab044e69ca6a6a1833f653df3"
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
