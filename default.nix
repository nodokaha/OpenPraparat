{ pkgs ? import <nixpkgs> {} }:
with pkgs;
pkgs.mkShell {
  name = "OpenPraparat";
#  buildInputs = [ pkgs.vulkan-headers pkgs.freeglut pkgs.stdenv.cc gfortran (pkgs.gcc48.cc.override {langFortran=true; langCC=true;langC=true;}) xorg.libXdmcp  pkgs.xorg_sys_opengl pkgs.glfw3 pkgs.glui pkgs.gl3w pkgs.mesa_glu pkgs.cmake pkgs.gtk2 pkgs.pkg-config ];
  buildInputs = [ pkgs.freeglut pkgs.vulkan-headers gfortran xorg.libXdmcp  pkgs.xorg_sys_opengl pkgs.glfw3 pkgs.glui pkgs.gl3w pkgs.mesa_glu (pkgs.gcc11.cc.override {langFortran=true; langCC=true;langC=true;}) pkgs.cmake pkgs.gtk2 pkgs.pkg-config pkgs.automake pkgs.autoconf pkgs.autobuild];
  shellHook =
    ''
    autoreconf -fiv
    ./configure
    make
    '';  
}
