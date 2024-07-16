$pkg     = "github.com/spiceai/spiceai"
$tags    = %w()
$darwin_aarch64_sha256 = "8839bde8c84485b293d190d87a68af7a4674c605381142515c1f3deadbf4d2e8"
$darwin_x86_64_sha256 = "d7a97b4169867e10927b9d037f469366e1b49cf3073ddf290173a679f0defb9f"
$linux_x86_64_sha256 = "702eb7cc8bdf6b69f77ff67335b2fa832c20c58021fa03e3a7caf43262bea7b9"

class Spiced < Formula
  desc "A unified SQL query interface and portable runtime to locally materialize, accelerate, and query data tables sourced from any database, data warehouse, or data lake."
  homepage "https://#{$pkg}"
  url "https://#{$pkg}"
  version "v0.15.2-alpha"
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
