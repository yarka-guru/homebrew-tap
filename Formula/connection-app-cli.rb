class ConnectionAppCli < Formula
  desc "ConnectionApp CLI — secure tunneling via AWS SSM"
  homepage "https://github.com/yarka-guru/connection_app"
  version "3.9.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/connection-app-cli-aarch64-apple-darwin.tar.gz"
      sha256 "0f8d2660ee56bc9f03147e795d9a1b1b06d765fbdef68df911678b6d8b3414e6"
    end
    on_intel do
      url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/connection-app-cli-x86_64-apple-darwin.tar.gz"
      sha256 "b89ddb51c68905c585aa0c8d49925b8225afd20b816b27810673256c7b80c3e3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/connection-app-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5f66fde472bb360d470be8979a68d711a2b1431c1c99fd5886544c93ebcbcc69"
    end
    on_intel do
      url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/connection-app-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "af169f15e1def00b8d64a6c20c159ddb0a7f0995cc7dc67447f7eeb198d9e2ec"
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
