$pkg     = "github.com/spiceai/spiceai"
$tags    = %w()
$darwin_aarch64_sha256 = "a8694c32d2253bc2cfd35aafb780829d54d4fdaada05d4b10eeaea3ece22034e"
$darwin_x86_64_sha256 = "bebd154890403a4b8c272d670e9446f984c9bd0c36d6db50249773f0d5501c0c"
$linux_x86_64_sha256 = "803875ab7b5cd9d88afb79ed0b291634b576050835156bc45ffe5385e5ebe79c"

class Spice < Formula
  desc "Spice.ai CLI"
  homepage "https://#{$pkg}"
  url "https://#{$pkg}"
  version "v0.17.2-beta"
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
