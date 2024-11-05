$pkg     = "github.com/spiceai/spiceai"
$tags    = %w()
$darwin_aarch64_sha256 = "33e5b36c978648273b33da2dc5f637de4d58bc2aa3d3e46d5c8d296d171ae2eb"
$darwin_x86_64_sha256 = "dc7e94c957b471b15ff435cbb37f8067394d4319c1d9995ee9dc82f72b6f24ea"
$linux_x86_64_sha256 = "e12be94389ae09e3b10a09c00479ef0ec6961c963b5ae251d1dc3c866097d5e6"

class Spiced < Formula
  desc "A unified SQL query interface and portable runtime to locally materialize, accelerate, and query data tables sourced from any database, data warehouse, or data lake."
  homepage "https://#{$pkg}"
  url "https://#{$pkg}"
  version "v0.20.0-beta"
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
