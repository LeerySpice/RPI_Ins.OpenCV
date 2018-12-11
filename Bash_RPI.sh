#!/bin/bash
# MAINTAINER jaraa.eduardo@gmail.com
# Date Release 28/11/2018

# Install SDK Basler Pylon 5

TMPDIR=$(mktemp -d)
wget https://www.baslerweb.com/fp-1523350746/media/downloads/software/pylon_software/pylon-5.0.12.11829-armhf.tar.gz -O $TMPDIR/SDK_Pylon.tar.gz
tar xvf $TMPDIR/SDK_Pylon.tar.gz -C $TMPDIR/
sudo tar xvf $TMPDIR/pylon-5.0.12.11829-armhf/pylonSDK-5.0.12.11829-armhf.tar.gz -C /opt/

PYLON=/opt/pylon5
source $PYLON/bin/pylon-setup-env.sh $PYLON

# Install OpenCV 3.0.0

sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install cmake -y

TMPDIR=$(mktemp -d)

sudo apt-get install -y build-essential git cmake pkg-config \
    libjpeg-dev libtiff5-dev libjasper-dev libpng12-dev \
    libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \
    libxvidcore-dev libx264-dev libgtk2.0-dev \
    libatlas-base-dev gfortran \
    python2.7-dev python3-dev -y

sudo apt-get -y install build-essential cmake cmake-qt-gui pkg-config libpng12-0 \
    libpng12-dev libpng++-dev libpng3 libpnglite-dev zlib1g-dbg zlib1g \
    zlib1g-dev pngtools libtiff5-dev libtiff5 libtiffxx0c2 libtiff-tools -y


sudo apt-get install libgtk2.0-dev -y

wget -O $TMPDIR/opencv.zip https://github.com/Itseez/opencv/archive/3.0.0.zip

unzip $TMPDIR/opencv.zip -d $TMPDIR

mkdir $TMPDIR/opencv-3.0.0/build

cd $TMPDIR/opencv-3.0.0/build/

cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D INSTALL_C_EXAMPLES=ON \
      -D INSTALL_PYTHON_EXAMPLES=ON \
      -D WITH_FFMPEG=OFF  \
      -D BUILD_EXAMPLES=OFF \
      -D ENABLE_PRECOMPILED_HEADERS=OFF ..

sudo make
sudo make install


# Install Mercurial & Repository SICPA-EP

sudo apt-get install git -y
sudo git clone https://github.com/LeerySpice/RPi-BaslerOpencv /home/pi/BASLER/

# Compile SICPA-EP

cd /home/BASLER/
sudo make -j4


