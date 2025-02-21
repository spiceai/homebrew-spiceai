$pkg = "github.com/spiceai/spiceai"
$darwin_aarch64_sha256 = "eebdbee4f7f7f41466c87bab924ac81d0cc0dced8ee46afad1394ff01b0abcd7"
$linux_x86_64_sha256 = "b6b6d5820afe4b245439713f03480a5b73f2ca60bac67b0b2606d2c5f221e2ed"
$linux_aarch64_sha256 = "f7813ee61955f191801dc96959c488b1bb27e40a4bae6bd32e572c9bb58af357"

class Spice < Formula
  desc "Spice.ai CLI"
  homepage "https://#{$pkg}"
  url "https://#{$pkg}"
  version "v1.0.3"
  revision 1

  BASE_URL = "https://#{$pkg}/releases/download/#{version}"
  ERROR_MSG = "Unfortunately, your OS architecture is not supported. For supported architectures, please visit spiceai.org/docs/installation#supported-os-architectures"

  on_macos do
    if Hardware::CPU.arm?
      url "#{BASE_URL}/spice_darwin_aarch64.tar.gz"
      sha256 $darwin_aarch64_sha256
    else
      odie ERROR_MSG
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{BASE_URL}/spice_linux_aarch64.tar.gz"
      sha256 $linux_aarch64_sha256
    elsif Hardware::CPU.intel?
      url "#{BASE_URL}/spice_linux_x86_64.tar.gz"
      sha256 $linux_x86_64_sha256
    else
      odie ERROR_MSG
    end
  end

  def install
      bin.install "spice" => "spice"
  end
end
