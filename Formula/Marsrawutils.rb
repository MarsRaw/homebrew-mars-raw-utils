# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Marsrawutils < Formula
    desc "Utilities for working with publicly available raw MSL, Mars2020, and InSight images"
    homepage "https://github.com/kmgill/mars-raw-utils"
    url "https://github.com/kmgill/mars-raw-utils/archive/refs/tags/v0.3.2.tar.gz"
    sha256 "30e4c279118a954de69a2e7366be7d0d18d3a7af8b81d8922559dd342c073ed7"
    version "0.3.2"

    depends_on "rust" => :build

    resource "marsdata" do
      url "https://github.com/kmgill/mars-raw-utils-data/releases/download/0.3.2/mars-raw-utils-data-0.3.2.tar.gz"
      sha256 "58509ae09bf3a96c1e972705303949f1e327e4c0efe37c68d5aaa55865dc52a9"
    end

    def install
      (prefix/"data").install resource("marsdata")
      system "cargo", "install", "--locked", "--root", prefix, "--path", "."
    end
  end