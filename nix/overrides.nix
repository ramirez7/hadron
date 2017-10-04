let
  pkgs = import ../nix/pkgs.nix;
in {
  lcs = pkgs.fetchFromGitHub {
    owner = "juanpaucar";
    repo = "lcs";
    rev = "40cc3bc32b5cd96d78f224850ec2d4428051b8b1";
    sha256 = "08w81cpbdg4jli11h8ybrxxgrlgbsxcv9p2m7gra53hdnnsmfy8d";
  };
}
