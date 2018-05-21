{ oldStable, stable, unstable }:
{
  my_fonts = with stable; buildEnv {
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
