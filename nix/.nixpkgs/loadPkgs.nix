bootstrap: file:
let 
  nixpkgs = builtins.fromJSON (builtins.readFile file);
  src = bootstrap.fetchFromGitHub {
    owner = "NixOS";
    repo = "nixpkgs";
    inherit (nixpkgs) rev sha256;
  };
in import src { }
