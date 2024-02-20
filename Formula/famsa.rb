# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Famsa < Formula
  desc "Algorithm for ultra-scale multiple sequence alignments (3M protein sequences in 5 minutes and 24 GB of RAM)"
  homepage "https://github.com/refresh-bio/FAMSA/"
  url "https://github.com/refresh-bio/FAMSA/archive/refs/tags/v2.2.2.tar.gz"
  version "2.2.2"
  sha256 "9e1d96b80ff0010852dcab24f8691bf2deb7415838c001f0362ec72fd0ac2d44"
  license "GPL-3.0"

  def install
    system "make"
    bin.install "famsa"
  end

  test do
    shell_output("#{bin}/famsa -help", result = 0)
  end
end
