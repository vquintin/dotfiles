{pkgs}:
{
    media_picture = with pkgs; buildEnv {
      name = "media-picture";
      paths = [
        feh
        gphoto2
        gimp
        graphviz
        rawtherapee
        shotwell
        ufraw
        xfce.ristretto
      ];
    };
}
