# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Taxonkit < Formula
  desc "A Practical and Efficient NCBI Taxonomy Toolkit, also supports creating NCBI-style taxdump files for custom taxonomies like GTDB/ICTV"
  homepage "https://bioinf.shenwei.me/taxonkit"
  url "https://github.com/shenwei356/taxonkit/archive/refs/tags/v0.17.0.tar.gz"
  version "0.17.0"
  sha256 "973431541ab737d094258704ebadf238e1159764655cc72b1dcd8a601d9f9c6a"
  license "MIT"

  depends_on "go" => :build

  def install
    # Remove unrecognized options if they cause configure to fail
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method

    system "go", "build", "-C", "taxonkit"
    bin.install "taxonkit/taxonkit"
  end

  test do
	shell_output("#{bin}/taxonkit --help 1>&2", result = 0)
  end
end
