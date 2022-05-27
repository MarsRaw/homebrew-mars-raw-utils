# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Marsrawutils < Formula
    desc "Utilities for working with publicly available raw MSL, Mars2020, and InSight images"
    homepage "https://github.com/kmgill/mars-raw-utils"
    url "https://github.com/kmgill/mars-raw-utils/archive/refs/tags/v0.5.1.tar.gz"
    sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    version "0.5.1"

    depends_on "rust" => :build

    resource "marsdata" do
      url "https://github.com/kmgill/mars-raw-utils-data/releases/download/0.3.2/mars-raw-utils-data-0.3.2.tar.gz"
      sha256 "58509ae09bf3a96c1e972705303949f1e327e4c0efe37c68d5aaa55865dc52a9"
    end

    def install
      (prefix/"data").install resource("marsdata")
      ENV["MARSDATAROOT"] = "#{prefix}/data"
      system "cargo", "install", "--locked", "--root", prefix, "--path", "."
    end
  end