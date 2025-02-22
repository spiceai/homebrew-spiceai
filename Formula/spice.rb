$pkg     = "github.com/spiceai/spiceai"
$tags    = %w()
$darwin_aarch64_sha256 = "c9e2798a7444867d82879fc3d166daf6c43334beceba89d5ccc8db0c69ce7bcd"
$darwin_x86_64_sha256 = "2537b42b9c1fc2b436380ea12539bfdec4d7695aeaf27735709b915cd11d3291"
$linux_x86_64_sha256 = "cb962077b6c4d089da5ba0f3efd29ffe8266ac1af5a2c16fca8936bba451443e"

class Spice < Formula
  desc "Spice.ai CLI"
  homepage "https://#{$pkg}"
  url "https://#{$pkg}"
  version "v1.0.4"
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
