# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Marsrawutils < Formula
    desc "Utilities for working with publicly available raw MSL, Mars2020, and InSight images"
    homepage "https://github.com/kmgill/mars-raw-utils"
    url "https://github.com/kmgill/mars-raw-utils/releases/download/v0.7.0/mars-raw-utils_homebrew_v0.7.0.tar.gz"
    sha256 "7e48cf9680a1ad4bd7ff4be32b8ecbcf7ef34957b00b1badf8a684741e3752a2"
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
