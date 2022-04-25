# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class MarsRawUtils < Formula
    desc "Utilities for working with publicly available raw MSL, Mars2020, and InSight images"
    homepage "https://github.com/kmgill/mars-raw-utils"
    url "https://github.com/kmgill/mars-raw-utils/releases/download/latest/marsrawutils-mac.tar.gz"
    sha256 ""
    version "0.3.2"
  
    def install
      bin.install "mars-raw-utils"
    end
  end