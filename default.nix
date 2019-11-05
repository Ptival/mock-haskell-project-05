{ mkDerivation, base, hpack, project, stdenv }:
mkDerivation {
  pname = "outer-project";
  version = "0.0.1";
  src = ./.;
  libraryHaskellDepends = [ base project ];
  libraryToolDepends = [ hpack ];
  prePatch = "hpack";
  license = "unknown";
  hydraPlatforms = stdenv.lib.platforms.none;
}
