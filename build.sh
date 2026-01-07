# This is for compiling in local NOI Linux 2.0 environment. 
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
