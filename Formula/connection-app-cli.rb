class ConnectionAppCli < Formula
  desc "ConnectionApp CLI — secure tunneling via AWS SSM"
  homepage "https://github.com/yarka-guru/connection_app"
  version "3.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/connection-app-cli-aarch64-apple-darwin.tar.gz"
      sha256 "f3a8fce55fedad800e74a87c61bc80ab71686b1c5ffc7623b9d0d67b68e0499a"
    end
    on_intel do
      url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/connection-app-cli-x86_64-apple-darwin.tar.gz"
      sha256 "0996309d8540beff3b5534cc72f2629f92f7efa5cd7b0f91e754320a089532e9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/connection-app-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "326c254e9cd21a8f6188d4d709535c18f098f3bbe4f586c699d4d935392bd747"
    end
    on_intel do
      url "https://github.com/yarka-guru/connection_app/releases/download/v#{version}/connection-app-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3f16b5be5a687e3a3a14e5a93460d52d01c38dcf6050c7d29786fe1583628083"
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
