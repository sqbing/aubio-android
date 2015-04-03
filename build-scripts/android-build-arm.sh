#! /bin/sh

NDK_HOME=~/Library/Android/ndk
TOOLCHAIN_HOME=~/toolchain

# build toolchain first:
# $(NDK_HOME)/build/tools/make-standalone-toolchain.sh --platform=android-21 --install-dir=$(TOOLCHAIN_HOME) ----toolchain=arm-linux-androideabi-4.6

# build aubio
set -x
set -e
export CC=$NDK_HOME/bin/arm-linux-androideabi-gcc
export CFLAGS="-I$NDK_HOME/include -mthumb"
export LDFLAGS="-L$NDK_HOME/lib "
export AR=$NDK_HOME/bin/arm-linux-androideabi-ar
./waf distclean
./waf configure --with-target-platform android --disable-jack --disable-avcodec --disable-sndfile
./waf build --verbose
./waf install --destdir dist-android/arm
