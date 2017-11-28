source $stdenv/setup

cd $src
make install PREFIX=$out
