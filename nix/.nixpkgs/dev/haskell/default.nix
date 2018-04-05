{pkgs}:
{
    haskell_stuff = with pkgs; buildEnv {
      name = "haskell-stuff";
      paths = [
        stack
      ];
    };
}
