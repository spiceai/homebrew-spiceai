$pkg = "github.com/spiceai/spiceai"
$darwin_aarch64_sha256 = "a6b3a8c8e47170bf52a30d2d99a196ec608693dae3d5d2e1d72a051ddebd555e"
$linux_x86_64_sha256 = "2bac91c0c9f415bc40a97443f30e1c649db909a26f592ce3b467bc78c4a3dc0f"
$linux_aarch64_sha256 = "96c2ae65e32663a3aa7aee13e86abf99f2491e3eaae0c865a01205e5a8c47951"

class Spiced < Formula
  desc "A unified SQL query interface and portable runtime to locally materialize, accelerate, and query data tables sourced from any database, data warehouse, or data lake."
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
      bin.install "spiced" => "spiced"
  end
end
