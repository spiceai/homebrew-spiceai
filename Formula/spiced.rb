$pkg = "github.com/spiceai/spiceai"
$darwin_aarch64_sha256 = "5c31f6c1ad7c476ec5718b73d7a0f5786e980df1893092360004c550c4322502"
$linux_x86_64_sha256 = "91d8af95e456141886b9277bc12b6154ab6a66408803487a2f8ea5a60922f37a"
$linux_aarch64_sha256 = "78a0ff86e796c42124ad5bc3cc3fca63efc3fa6a77fe74da9d62f09d91c7003e"

class Spiced < Formula
  desc "A unified SQL query interface and portable runtime to locally materialize, accelerate, and query data tables sourced from any database, data warehouse, or data lake."
  homepage "https://#{$pkg}"
  url "https://#{$pkg}"
  version "v1.0.4"
  revision 1

  BASE_URL = "https://#{$pkg}/releases/download/#{version}"
  ERROR_MSG = "Your OS architecture does not have a pre-built binary. For supported architectures, visit https://spiceai.org/docs/installation#supported-os-architectures"

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
      bin.install "spiced" => "spiced"
  end
end
