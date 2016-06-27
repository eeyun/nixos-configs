with import <nixpkgs> {};

rustPlatform.buildRustPackage rec{
    name = "delivery-cli";
    version = "0.0.1";

    src = fetchgit {
      url = "https://github.com/chef/delivery-cli";
      rev = "bf5bf2664991cb58b0343dbcb2755c6101dcf932";
      sha256 = "03mik9wlbcya1nscpxxwqwlpk0lihrjymwbffh00g8b0j6b5grph";
    };

    depsSha256 = "";
    meta = with stdenv.lib; {
        description = "Command line program for interacting with Delivery APIs";
        homepage = "https://github.com/chef/delivery.git";
    };
}
