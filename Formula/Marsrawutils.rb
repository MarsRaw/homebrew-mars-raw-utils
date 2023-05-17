# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Marsrawutils < Formula
    desc "Utilities for working with publicly available raw MSL, Mars2020, and InSight images"
    homepage "https://github.com/kmgill/mars-raw-utils"
    url "https://github.com/kmgill/mars-raw-utils/archive/refs/tags/v0.7.0.tar.gz"
    sha256 "a4c873245674c154e79a31bfca43c49c1933ff6628117b8bff5eb9151ce6fa9c"
    version "0.7.0"

    depends_on "rust" => :build

    resource "marsdata" do
      url "https://github.com/kmgill/mars-raw-utils-data/archive/refs/tags/0.7.0.tar.gz"
      sha256 "e4a2c35d43df60f060450873377bccab47dd7fb563423ce6f8a90702edf89751"
    end

    def install
      (prefix/"data").install resource("marsdata")
      ENV["MARSDATAROOT"] = "#{prefix}/data"
      system "cargo", "install", "--locked", "--root", prefix, "--path", "."
    end
  end
