{ oldStable, stable, unstable }:
{
    media_picture = with stable; buildEnv {
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
