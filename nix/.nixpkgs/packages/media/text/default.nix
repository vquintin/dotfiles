{ oldStable, stable, unstable }:
{
    media_text = with stable; buildEnv {
      name = "media-text";
      paths = [
        calibre
        libreoffice
        open-dyslexic
        pandoc
        texlive.combined.scheme-full
      ];
    };
}
