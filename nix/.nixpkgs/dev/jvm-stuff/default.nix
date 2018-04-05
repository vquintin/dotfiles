{pkgs}:
{
  jvm_stuff = with pkgs; buildEnv {
    name = "jvm-stuff";
    paths = [
      ammonite
      jetbrains.idea-community
      openjdk
      scala
      sbt
      visualvm
    ];
  };
}
