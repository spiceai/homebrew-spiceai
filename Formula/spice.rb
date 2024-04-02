$pkg     = "github.com/spiceai/spiceai"
$tags    = %w()
$darwin_aarch64_sha256 = "f0322bd56ebc605819d14d07206190481d75e83e50df4b1e1480725629cfc22f"
$darwin_x86_64_sha256 = "12251b4d84a8211ccab641e838e8cb225a2c93190043280af3761fa6b4a08e80"
$linux_x86_64_sha256 = "ced1484850ca18d57339a4ab8400d984ce7daaddcefeb6957e808ba4c23d21ab"

class Spice < Formula
  desc "Spice.ai CLI"
  homepage "https://#{$pkg}"
  url "https://#{$pkg}"
  version "v0.10.1-alpha"
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
