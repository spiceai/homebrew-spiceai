$pkg = "github.com/spiceai/spiceai"
$darwin_aarch64_sha256 = "860bc27d3fe463d958f5dbc7880a1b92ec350620ef5b5ae714f4cd8b1eff5f24"
$linux_x86_64_sha256 = "d750f440fc07503fca5e1110b281c8d068d5b14d5d23c8968311d3091faabcb0"
$linux_aarch64_sha256 = "2cc3e7d57f049694eccb27689df1160dc9b257b500c075093da7ed1e139115cc"

class Spice < Formula
  desc "Spice.ai CLI"
  homepage "https://#{$pkg}"
  url "https://#{$pkg}"
  version "v1.11.0-rc.1"
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
