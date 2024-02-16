# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Sswlib < Formula
  desc ""
  homepage ""
  url "https://github.com/mengyao/Complete-Striped-Smith-Waterman-Library/archive/refs/tags/v1.2.5.tar.gz"
  version "1.2.5"
  sha256 "b294c0cb6f0f3d578db11b4112a88b20583b9d4190b0a9cf04d83bb6a8704d9a"
  license ""

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    system "make", "-C", "src/"
    bin.install "src/ssw_test"
    lib.install "src/libssw.so"
  end

  test do
    shell_output("#{bin}/ssw_test", result = 1)
  end
end
