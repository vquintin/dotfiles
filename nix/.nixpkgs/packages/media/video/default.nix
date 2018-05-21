{ oldStable, stable, unstable }:
{
    media_video = with stable; buildEnv {
      name = "media-video";
      paths = [
        kodi
        smplayer
        vdpauinfo
        vlc
      ];
    };
}
