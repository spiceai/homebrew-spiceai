$pkg     = "github.com/spiceai/spiceai"
$tags    = %w()

class Spiced < Formula
  desc "A unified SQL query interface and portable runtime to locally materialize, accelerate, and query data tables sourced from any database, data warehouse, or data lake."
  homepage "https://#{$pkg}"
  url "https://#{$pkg}"
  version "v0.9-alpha"
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
        url "https://github.com/spiceai/spiceai/releases/download/#{version}/spiced_darwin_aarch64.tar.gz"
        sha256 "724e63a0050d615f4c596ec9b76785c72fde1bec052a1c7d63e5712c660ffc68"
    else
        url "https://github.com/spiceai/spiceai/releases/download/#{version}/spiced_darwin_x86_64.tar.gz"
        sha256 "a1269ddf13de43a2b0939e4f2776d86ade917258b44066e9343677bce1ef9546"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
    else
        url "https://github.com/spiceai/spiceai/releases/download/#{version}/spiced_linux_x86_64.tar.gz"
        sha256 "281b0e516943035ef5c65a907794509e183ba55fb8d102436e88b264d210eeab"
    end
  end

  def install
      bin.install "spiced" => "spiced"
  end
end
