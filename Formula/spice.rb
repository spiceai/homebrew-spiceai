$pkg     = "github.com/spiceai/spiceai"
$tags    = %w()

class Spice < Formula
  desc "Spice.ai CLI"
  homepage "https://#{$pkg}"
  url "https://#{$pkg}"
  version "v0.9.1-alpha"
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
        url "https://github.com/spiceai/spiceai/releases/download/#{version}/spice_darwin_aarch64.tar.gz"
        sha256 "48ba81df256a543ed28e5c7ac744b5164388adac40dcf34e58b9ea5d6296cbe5"
    else
        url "https://github.com/spiceai/spiceai/releases/download/#{version}/spice_darwin_x86_64.tar.gz"
        sha256 "87162c66857adfb4aad6cd1a60b0d217e83080cc95f6d9522440cef2c17aa961"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
    else
        url "https://github.com/spiceai/spiceai/releases/download/#{version}/spice_linux_x86_64.tar.gz"
        sha256 "7c0ebd69765d105ddd04c90f0be987f796e4d4a1c90c14ef0ee1ec6ad8d6ebce"
    end
  end

  def install
      bin.install "spice" => "spice"
  end
end
