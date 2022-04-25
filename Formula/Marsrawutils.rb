# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Marsrawutils < Formula
    desc "Utilities for working with publicly available raw MSL, Mars2020, and InSight images"
    homepage "https://github.com/kmgill/mars-raw-utils"
    url "https://github.com/kmgill/mars-raw-utils/archive/refs/tags/v0.3.2.tar.gz"
    sha256 "ae6c651b518f151988368478efb8e6653a00ed7f47d35f4355b6962f0cf1b06e"
    version "0.3.2"

    depends_on "rust" => :build

    def install
      system "cargo", "install", "--locked", "--root", prefix, "--path", "."
    end
  end