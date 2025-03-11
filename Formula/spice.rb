$pkg = "github.com/spiceai/spiceai"
$darwin_aarch64_sha256 = "acef837ffcf9cc72c759b23ff971406c6f9d17ee5b60c26045f9a69f06c33012"
$linux_x86_64_sha256 = "a0628ee12bbf989af278a6b43717352e957cc5179ccc900b056c8b4daf8c1af6"
$linux_aarch64_sha256 = "603a98ce71b2dbf95da04b9eb29bcfccd47f71202cf53b336437c6d901a00f18"

class Spice < Formula
  desc "Spice.ai CLI"
  homepage "https://#{$pkg}"
  url "https://#{$pkg}"
  version "v1.0.5"
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
