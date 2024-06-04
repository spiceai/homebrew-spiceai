$pkg     = "github.com/spiceai/spiceai"
$tags    = %w()
$darwin_aarch64_sha256 = "4dff6e5faf6ed89a961279298355273c4afec5cf69284efe097c3327de06b389"
$darwin_x86_64_sha256 = "cd70357e86d98faf68589976d07be162d3f795adb15212f917cd77a0356e9f20"
$linux_x86_64_sha256 = "acacd42c44d4b7b8c4c30d6e79f98885d2cbd6fe80bfa5b3fd5dabd11c851fae"

class Spice < Formula
  desc "Spice.ai CLI"
  homepage "https://#{$pkg}"
  url "https://#{$pkg}"
  version "v0.13.2-alpha"
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
