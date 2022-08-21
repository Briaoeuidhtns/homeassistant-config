with (import ./inputs.nix);
mach-nix.mkPython {
  requirements = builtins.readFile ./requirements.txt;
  providers = {
    # can't find wheel package when pulling from wheel?
    appdaemon = "sdist";
  };
}
