#{ fetchgit, python, lib, buildPythonApplication, pythonPackages }:

with import <nixpkgs> {};

pythonPackages.buildPythonApplication rec{
  name = "rainbowstream-${version}";
  version = "1.3.3";

  src = fetchgit {
   url = "https://github.com/DTVD/rainbowstream.git";
   rev = "5edc9cd172a33b2fd0379f212b8b9780e3213396";
   sha256 = "0azd6xp845apipwshxq534kz43qlmcg7dvr00dqpscw7a52p99zr";
  };

  requests = with python27Packages; requests2.override  rec {
    name = "request-2.5.3";

      src = fetchurl {
        url = https://github.com/kennethreitz/requests/archive/v2.5.3.tar.gz;
        sha256 = "88795815ee979c6acbb7002288cf2ab72b5426b86f7270f57e2600bbbaf55c43";
      };
  };

  propagatedBuildInputs = with pythonPackages; [ dateutil arrow requests pyfiglet twitter pillow pilkit pysocks ];

  meta = with stdenv.lib; {
    description = "Terminal program for doing twitter!";
    homepage = "https://github.com/DTVD/rainbowstream";
    license = licenses.gpl3;
  };

}
