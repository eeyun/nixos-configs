{ fetchgit, python, lib, buildPythonApplication, pythonPackages }:
#with import <nixpkgs> {};
#with lib;

pythonPackages.buildPythonApplication rec{
  name = "gcalcli-${version}";
  version = "3.3.2";

  src = fetchgit {
    url = "https://github.com/insanum/gcalcli.git";
    rev = "12d0f04a48c8ec3260e343e627f38a532399986";
    sha256 = "0fiwyknd0nrpg1nwp1n8mgjb1hcp0rbx3vhzjrsvsdh8981g5gi5";
  };

  propagatedBuildInputs = with pythonPackages; [ dateutil gflags httplib2 six vobject parsedatetime google_api_python_client oauth2client pytz six vobject parsedatetime ];

  meta = with stdenv.lib; {
    description = "Terminal program for managing Google Calendar";
    homepage = "https://github.com/insanum/gcalcli";
    license = licenses.gpl3;
  };

} 
