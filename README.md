## Smartcard autentication plugin for pw3270.


## Instalation

## Building for Linux

### Requirements

* [lib3270](../../../lib3270)
* [libv3270](../../../libv3270)

### Building

## Building for windows

### Cross-compiling on SuSE Linux (Native or WSL)

TODO

### Windows native with MSYS2

1. Build and install [libv3270](../../../libv3270)
2. Build library using the mingw shell

   ```shell
   cd smartcardautentication
   ./autogen.sh
   make all
   ```
3. Install

   ```shell
   make install
   ```
