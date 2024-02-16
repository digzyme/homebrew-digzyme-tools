# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Plmc < Formula
  desc ""
  homepage ""
  url "https://github.com/debbiemarkslab/plmc/archive/refs/heads/master.zip"
  version "18c9e55"
  sha256 "3141129e9c9e9185ffb5abd728e8f9de789e8056e96a92ba6cce38b5d16b67e4"
  license "MIT"

  on_macos do
    depends_on "libomp" => :build
  end

  def install
    on_macos do
      system "make", "all-mac-openmp"
    end
    on_linux do
      system "make", "all-openmp"
    end
    bin.install "bin/plmc"
  end

  test do
    shell_output("plmc", result = 1)
  end
end
