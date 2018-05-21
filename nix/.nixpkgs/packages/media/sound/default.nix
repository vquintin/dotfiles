{ oldStable, stable, unstable }:
{
    media_sound = with stable; buildEnv {
      name = "media-sound";
      paths = [
        clementine
      ];
    };
}
