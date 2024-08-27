$pkg     = "github.com/spiceai/spiceai"
$tags    = %w()
$darwin_aarch64_sha256 = "3590f0ff5d1cf80d49b6ebb16988316ab093741d7b73cf0267bd395b49676d7c"
$darwin_x86_64_sha256 = "c29504fd38f968e8e60b2c24fb456ffcbdb253de19671d62dc3e6687b7eaeef5"
$linux_x86_64_sha256 = "361ed139b8c7af53bbff545f1e6f934f5cbe19273a7974f0b202eba779dd14c8"

class Spiced < Formula
  desc "A unified SQL query interface and portable runtime to locally materialize, accelerate, and query data tables sourced from any database, data warehouse, or data lake."
  homepage "https://#{$pkg}"
  url "https://#{$pkg}"
  version "v0.17.2-beta"
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
        url "https://github.com/spiceai/spiceai/releases/download/#{version}/spiced_darwin_aarch64.tar.gz"
        sha256 $darwin_aarch64_sha256
    else
        url "https://github.com/spiceai/spiceai/releases/download/#{version}/spiced_darwin_x86_64.tar.gz"
        sha256 $darwin_x86_64_sha256
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
    else
        url "https://github.com/spiceai/spiceai/releases/download/#{version}/spiced_linux_x86_64.tar.gz"
        sha256 $linux_x86_64_sha256
    end
  end

  def install
      bin.install "spiced" => "spiced"
  end
end
