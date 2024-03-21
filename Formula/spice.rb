$pkg     = "github.com/spiceai/spiceai"
$tags    = %w()

class Spice < Formula
  desc "A unified SQL query interface and portable runtime to locally materialize, accelerate, and query data tables sourced from any database, data warehouse, or data lake."
  homepage "https://#{$pkg}"
  url "https://#{$pkg}"
  version "v0.9-alpha"
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
        url "https://github.com/spiceai/spiceai/releases/download/#{version}/spice_darwin_aarch64.tar.gz"
        sha256 "2ba8a309b80dba160f56f938962bca0014e8414fe9e635a600175b155cf2004a"
    else
        url "https://github.com/spiceai/spiceai/releases/download/#{version}/spice_darwin_x86_64.tar.gz"
        sha256 "28227e7f02be240a5d96c609a472b6960cd67e7136861a0096bd42df86346ffd"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
    else
        url "https://github.com/spiceai/spiceai/releases/download/#{version}/spice_linux_x86_64.tar.gz"
        sha256 "eaf89b7ef221837091bd8a6a435401fec12c4d249bc0474cceefeac9c64630e2"
    end
  end

  def install
      bin.install "spice" => "spice"
  end
end
