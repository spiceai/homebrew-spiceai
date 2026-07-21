$pkg = "github.com/spiceai/spiceai"
$darwin_aarch64_sha256 = "7f9b1a69bc34e579cc660ab4b8a171ab4a64317a16adab01c56778d0d71a2ca9"
$linux_x86_64_sha256 = "b2b2b3cd986ab58990f04f01c763c751943c9f5b406a0b442a56da5f4e680581"
$linux_aarch64_sha256 = "27a953ce90799d51993523c4bb1ceb9ed85de387d537135ffcf087afc74511cb"

class Spiced < Formula
  desc "A unified SQL query interface and portable runtime to locally materialize, accelerate, and query data tables sourced from any database, data warehouse, or data lake."
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
      url "#{BASE_URL}/spiced_darwin_aarch64.tar.gz"
      sha256 $darwin_aarch64_sha256
    else
      odie ERROR_MSG
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{BASE_URL}/spiced_linux_aarch64.tar.gz"
      sha256 $linux_aarch64_sha256
    elsif Hardware::CPU.intel?
      url "#{BASE_URL}/spiced_linux_x86_64.tar.gz"
      sha256 $linux_x86_64_sha256
    else
      odie ERROR_MSG
    end
  end

  def install
      bin.install "spiced" => "spiced"
  end
end
