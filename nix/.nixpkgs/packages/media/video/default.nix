{pkgs}:
{
    media_video = with pkgs; buildEnv {
      name = "media-video";
      paths = [
        kodi
        smplayer
        vdpauinfo
        vlc
      ];
    };
}
