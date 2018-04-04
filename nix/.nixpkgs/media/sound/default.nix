{pkgs}:
{
    media_sound = with pkgs; buildEnv {
      name = "media-sound";
      paths = [
        clementine
      ];
    };
}
