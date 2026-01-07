# This is for compiling in local NOI Linux 2.0 environment. Why does it work?

# sudo apt update
# sudo apt install -y build-essential ninja-build cmake pkgconf bash
# sudo apt install -y libgl1-mesa-dev libglu1-mesa-dev
# sudo apt install -y libfontconfig1-dev libfreetype6-dev libx11-dev libx11-xcb-dev libxext-dev libxfixes-dev libxi-dev libxrender-dev libxcb1-dev libxcb-glx0-dev libxcb-keysyms1-dev libxcb-image0-dev libxcb-shm0-dev libxcb-icccm4-dev libxcb-sync0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-randr0-dev libxcb-render-util0-dev  libxcb-xinerama0-dev libxkbcommon-dev libxkbcommon-x11-dev
# sudo apt install -y libharfbuzz-dev libsm-dev libdrm-dev
# sudo apt install -y libspdlog-dev
cd ..
ls qt
if [ $? != 0 ];
then
  rm qt-5.15.3-kde-static-linux.tar.gz
  wget https://github.com/Project-LemonLime/qt5ci/releases/latest/download/qt-5.15.3-kde-static-linux.tar.gz
  tar -zxvf qt-5.15.3-kde-static-linux.tar.gz
  rm qt-5.15.3-kde-static-linux.tar.gz
fi
mkdir build
pth=$(pwd)
cd build
cmake ../Project_LemonLime -GNinja -DCMAKE_BUILD_TYPE=Release -DLEMON_BUILD_INFO="Build for Linux" -DLEMON_BUILD_EXTRA_INFO="Build on $(uname -sr)" -DCMAKE_PREFIX_PATH="$pth/qt" -DQt5_DIR="$pth/qt/lib/cmake/Qt5"
cmake --build . --target package --parallel $(nproc)
cd ..
cd Project_LemonLime
cp ../build/lemon ./
rm -r ../build
