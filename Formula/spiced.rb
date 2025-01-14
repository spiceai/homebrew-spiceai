$pkg     = "github.com/spiceai/spiceai"
$tags    = %w()
$darwin_aarch64_sha256 = "bcb1a7261074166c1e83a802ef295d77c0576de22dbd4b7a28d18f2e83a11c09"
$darwin_x86_64_sha256 = "acd2268c5df56ee7a601bbc4c5670d34a6c8dea3731f17183351458d56c3575b"
$linux_x86_64_sha256 = "0af115046fb56a35346e23ee029fc3d43f2f208e4224af23678e7a8a92cdbc9d"

class Spiced < Formula
  desc "A unified SQL query interface and portable runtime to locally materialize, accelerate, and query data tables sourced from any database, data warehouse, or data lake."
  homepage "https://#{$pkg}"
  url "https://#{$pkg}"
  version "v1.0.0-rc.5"
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
        url "https://github.com/spiceai/spiceai/releases/download/#{version}/spiced_darwin_aarch64.tar.gz"
        sha256 $darwin_aarch64_sha256
    else
        url "https://github.com/spiceai/spiceai/releases/download/#{version}/spiced_darwin_x86_64.tar.gz"
        sha256 $darwin_x86_64_sha256
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
    else
        url "https://github.com/spiceai/spiceai/releases/download/#{version}/spiced_linux_x86_64.tar.gz"
        sha256 $linux_x86_64_sha256
    end
  end

  def install
      bin.install "spiced" => "spiced"
  end
end
