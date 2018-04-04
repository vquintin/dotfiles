{ pkgs}:
{
  my_fonts = with pkgs; buildEnv {
    name = "my-fonts";
    paths = [
      dejavu_fonts
      fira
      fira-code
      fira-mono
      font-droid
    ];
  };
}
