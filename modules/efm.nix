{ lib, pkgs, ... }:

pkgs.buildGoModule rec {
  name = "efm-langserver";
  version = "0.0.30";
  src = pkgs.fetchFromGitHub {
    owner = "mattn";
    repo = "efm-langserver";
    rev = "v${version}";
    sha256 = "sha256-xw3W3wvSTVvvCAG8YsXAqxrof4m58d81CntDb/DInOI=";
  };

  vendorSha256 = "sha256-tca+1SRrFyvU8ttHmfMFiGXd1A8rQSEWm1Mc2qp0EfI="; 

  meta = with lib; {
    description = "General purpose Language Server";
    homepage = "https://github.com/mattn/efm-langserver";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
