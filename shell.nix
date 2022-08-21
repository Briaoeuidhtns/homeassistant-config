{ project ? import ./nix { } }:

with (import ./inputs.nix);
project.pkgs.mkShell {
  buildInputs = [
    (builtins.attrValues project.devTools)
    (import ./python.nix)
    mach-nix.mach-nix
    pkgs.appdaemon
  ];
  shellHook = ''
    ${project.ci.pre-commit-check.shellHook}
  '';
}
