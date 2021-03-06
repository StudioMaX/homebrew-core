class Tldr < Formula
  desc "Simplified and community-driven man pages"
  homepage "https://tldr.sh/"
  url "https://github.com/tldr-pages/tldr-cpp-client/archive/v1.3.0.tar.gz"
  sha256 "6210ece3f5d8f8e55b404e2f6c84be50bfdde9f0d194a271bce751a3ed6141be"
  revision 2
  head "https://github.com/tldr-pages/tldr-cpp-client.git"

  bottle do
    cellar :any
    sha256 "c5f99efa930b7f80647496c83fe118bd184feae7c5f256dc67d7594aceba7120" => :mojave
    sha256 "00f5ce204fa62e51ed3be821abba9fdda36335b6cecf65231158c02b9713f357" => :high_sierra
    sha256 "06f9609695fb6b14bbd78f3246bb176b341aecda6ce70515723cee8e8e4ced69" => :sierra
    sha256 "209c571e3472128665194e73451199087236758a0a7cfa6e88ffd7aa444abbac" => :el_capitan
    sha256 "386524306b8dbbe90c06ecadddbdbca20cbedb9e2b078b85826eeb8021005ee4" => :x86_64_linux
  end

  depends_on "pkg-config" => :build
  depends_on "libzip"
  depends_on "curl" unless OS.mac?

  def install
    system "make", "PREFIX=#{prefix}", "install"
  end

  test do
    assert_match "brew", shell_output("#{bin}/tldr brew")
  end
end
