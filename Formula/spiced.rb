$pkg     = "github.com/spiceai/spiceai"
$tags    = %w()

class Spiced < Formula
  desc "A unified SQL query interface and portable runtime to locally materialize, accelerate, and query data tables sourced from any database, data warehouse, or data lake."
  homepage "https://#{$pkg}"
  url "https://#{$pkg}"
  version "v0.9.1-alpha"
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
        url "https://github.com/spiceai/spiceai/releases/download/#{version}/spiced_darwin_aarch64.tar.gz"
        sha256 "b993d0375863b1f73ead1288029e0723bdf2852c1b384a818ac04f3f1d4cf7de"
    else
        url "https://github.com/spiceai/spiceai/releases/download/#{version}/spiced_darwin_x86_64.tar.gz"
        sha256 "53e5db505799bcb85295c886e8b2d1b250a24fa15228b7d69409b75fcc3b0e8d"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
    else
        url "https://github.com/spiceai/spiceai/releases/download/#{version}/spiced_linux_x86_64.tar.gz"
        sha256 "6ca57857f37d4309257fcb392141341989736548589daee04f5b34ddc8cb55cd"
    end
  end

  def install
      bin.install "spiced" => "spiced"
  end
end
