# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Psipred < Formula
  desc "PSIPRED Protein Secondary Structure Predictor"
  homepage "https://github.com/psipred/psipred/"
  url "https://github.com/psipred/psipred/archive/refs/tags/v4.0.tar.gz"
  version "4.0"
  sha256 "ce4c901c8f152f6e93e4f70dc8079a5432fc64d02bcc0215893e33fbacb1fed2"
  license ""

  depends_on "gsed" => :build
  depends_on "brewsci/bio/blast-legacy"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    system "sed", "-e", "s/main\(/int main\(/", "-i", "src/sspred_avpred.c"
    system "make", "-C", "src/"
    system "make", "-C", "src/", "install"
    bin.install Dir["bin/*"]
  end

  test do
    shell_output("#{bin}/psipred", result = 255)
  end
end
