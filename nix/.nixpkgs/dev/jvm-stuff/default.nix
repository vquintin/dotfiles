{pkgs}:
{
  jvm_stuff = with pkgs; buildEnv {
    name = "jvm-stuff";
    paths = [
      jetbrains.idea-community
      openjdk
    ];
  };
}
