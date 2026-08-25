$pkg = "github.com/spiceai/spiceai"
$darwin_aarch64_sha256 = "349698e2ec86f5b05aea61c10ae943497e940a4816446d53de619dc38c5ec494"
$linux_x86_64_sha256 = "99a54a34943deb06017e96f0685490fa19b6742144d5820a17016eac740dffe3"
$linux_aarch64_sha256 = "35b32e807bdde5fc762093db7ecf2849074a0393846c35e8a8db677cef9553a8"

class Spice < Formula
  desc "Spice.ai CLI"
  homepage "https://#{$pkg}"
  url "https://#{$pkg}"
  version "v2.2.0"
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
