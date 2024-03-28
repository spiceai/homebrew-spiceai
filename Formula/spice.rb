$pkg     = "github.com/spiceai/spiceai"
$tags    = %w()
$darwin_aarch64_sha256 = "560e7fae87beb731e42a639837e9f928ba89a9dc410daf6324af8496c730976d"
$darwin_x86_64_sha256 = "c42592d4e12e1d05c412ceada3a4a3ddeff96872bf77f29ef44c61374bf91882"
$linux_x86_64_sha256 = "3ec9c1e05fa0900da05d2d4ed556e61d0f248177fde5992dc24cc612c18ffc51"

class Spice < Formula
  desc "Spice.ai CLI"
  homepage "https://#{$pkg}"
  url "https://#{$pkg}"
  version "v0.10.0-alpha"
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
        url "https://github.com/spiceai/spiceai/releases/download/#{version}/spice_darwin_aarch64.tar.gz"
        sha256 $darwin_aarch64_sha256
    else
        url "https://github.com/spiceai/spiceai/releases/download/#{version}/spice_darwin_x86_64.tar.gz"
        sha256 $darwin_x86_64_sha256
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
    else
        url "https://github.com/spiceai/spiceai/releases/download/#{version}/spice_linux_x86_64.tar.gz"
        sha256 $linux_x86_64_sha256
    end
  end

  def install
      bin.install "spice" => "spice"
  end
end
