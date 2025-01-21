# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Uchime < Formula
  desc "UCHIME and UCHIME2 are algorithms for detecting chimeric sequences"
  homepage "https://drive5.com/usearch/manual/uchime_algo.html"
  url "https://drive5.com/uchime/uchime4.2.40_src.tar.gz"
  version "4.2.40"
  sha256 "cb6a3aea4e8b4343a6e0ddde3b2755bbec53492bae5d6252ce8a7091061f353d"
  license "public domain"

  def install
    system "ENV_GCC_OPTS=env make ENV_GCC_OPTS='-std=c++11'"
    bin.install "uchime"
  end

  test do
    shell_output("#{bin}/uchime", result = 0)
  end
end
