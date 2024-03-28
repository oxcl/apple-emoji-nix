{ pkgs ? import <nixpkgs> {} }: with pkgs; stdenvNoCC.mkDerivation rec {
  pname = "apple-emoji-nix";
  version = "0.0.1";
  src = fetchurl {
    url = "https://github.com/samuelngs/apple-emoji-linux/releases/download/v17.4/AppleColorEmoji.ttf";
    hash = "sha256-SG3JQLybhY/fMX+XqmB/BKhQSBB0N1VRqa+H6laVUPE=";
  };
  dontBuild = true;
  dontUnpack = true;
  installPhase = ''
    install -Dm755 ${src} $out/share/fonts/truetype/AppleColorEmoji.ttf
  '';
  meta = with lib; {
    description = "Apple Emoji font for linux";
    homepage = "https://github.com/samuelngs/apple-emoji-linux";
  };
}
