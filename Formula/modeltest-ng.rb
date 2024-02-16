# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class ModeltestNg < Formula
  desc "ModelTest-NG is a tool for selecting the best-fit model of evolution for DNA and protein alignments."
  homepage "https://github.com/ddarriba/modeltest/"
  url "https://github.com/ddarriba/modeltest/files/6192893/modeltest-ng-0.1.7.tar.gz"
  sha256 "28d34f347843323a2d56e3e07fd44e122c702386e55cd91dccb105e544b9f33d"
  version "0.1.7"
  license "GPL-3.0-only"

  depends_on "cmake" => :build
  depends_on "flex"
  depends_on "bison"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    bin.install "bin/modeltest-ng"
  end

  test do
    shell_output("#{bin}/modeltest-ng --version 1>&2", result = 0)
  end
end
