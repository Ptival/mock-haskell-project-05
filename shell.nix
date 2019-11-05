{ nixpkgs ? import <nixpkgs> {}, compiler ? "default" }:

let

  inherit (nixpkgs) pkgs;

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};


  project = haskellPackages.callPackage (import ./submodules/mock-haskell-project-01/default.nix) {};
  outer-project = haskellPackages.callPackage (import ./default.nix) { inherit project; };

in

  if pkgs.lib.inNixShell then outer-project.env else outer-project
