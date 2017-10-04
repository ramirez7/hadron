let
  pkgs = import ./nix/pkgs.nix;
  overrides = import ./nix/overrides.nix;
in (pkgs.haskell.packages.ghc802.override {
   overrides = self: super: {
     lcs = self.callCabal2nix "lcs" overrides.lcs {};
   };
}).callCabal2nix "hadron" ./. {}
