# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Marsrawutils < Formula
    desc "Utilities for working with publicly available raw MSL, Mars2020, and InSight images"
    homepage "https://github.com/kmgill/mars-raw-utils"
    url "https://github.com/MarsRaw/mars-raw-utils/releases/download/v0.9.0/mars-raw-utils_homebrew_v0.9.0.tar.gz"
    sha256 "59f911144cf83753f9ff318f1f4aaec19bf18e900804bfcb8302255f20740f6e"
    version "0.9.0"

    depends_on "rust" => :build

    resource "marsdata" do
      url "https://github.com/MarsRaw/mars-raw-utils/archive/refs/tags/v0.9.0.tar.gz"
      sha256 "59f911144cf83753f9ff318f1f4aaec19bf18e900804bfcb8302255f20740f6e"
    end

    def install
      (prefix/"data").install resource("marsdata")
      ENV["MARSDATAROOT"] = "#{prefix}/data"
      system "cargo", "install", "--locked", "--root", prefix, "--path", "."
    end
  end
