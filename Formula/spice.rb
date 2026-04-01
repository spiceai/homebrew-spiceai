$pkg = "github.com/spiceai/spiceai"
$darwin_aarch64_sha256 = "75ac7b7a90e105409ec52209fdce7b9315464aaac503f21a137be952a3825994"
$linux_x86_64_sha256 = "fe698ecf87589d66014f0c6b7f03d9e7f4583547bd4ab6b89de9f2fbd53b7b44"
$linux_aarch64_sha256 = "cf7b2409cb4649bbd6c6e6243b6f71f286cdc051816dc9e2491e365e9b75e6ea"

class Spice < Formula
  desc "Spice.ai CLI"
  homepage "https://#{$pkg}"
  url "https://#{$pkg}"
  version "v1.11.5"
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
