$pkg = "github.com/spiceai/spiceai"
$darwin_aarch64_sha256 = "b8d1ee76d6c8da8b6c9c8a2a2fe71de8032e744360fe0128fd80d4a4cc768e35"
$linux_x86_64_sha256 = "3bcd7bd621fd1216d15d522e2f0c20b7168a2544ba77cf56c903a08f73ac2fc1"
$linux_aarch64_sha256 = "e5999594f11c10776a6a91df82f9b04b3581b31016c8b6d4a5c5614ef9964c12"

class Spice < Formula
  desc "Spice.ai CLI"
  homepage "https://#{$pkg}"
  url "https://#{$pkg}"
  version "v2.1.1"
  revision 1

  os = `uname`.strip.downcase
  arch = `uname -m`.strip

  case arch
  when /armv7.*/ then arch = "arm"
  when "arm64" then arch = "aarch64"
  when "amd64" then arch = "x86_64"
  end

  current_osarch = "#{os}-#{arch}"

  BASE_URL = "https://#{$pkg}/releases/download/#{version}"
  ERROR_MSG = "#{current_osarch} does not have a pre-built binary. For supported architectures, visit https://spiceai.org/docs/reference/system_requirements#operating-systems-and-architectures"

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
    ohai "Installing Spice CLI..."
    bin.install "spice" => "spice"
  end

  def post_install
    ohai "Upgrading Spice Runtime..."
    output = Utils.safe_popen_read("sh", "-c", "#{bin}/spice upgrade 2>&1")
    output.lines.each do |line|
      puts line
    end
  end
end
