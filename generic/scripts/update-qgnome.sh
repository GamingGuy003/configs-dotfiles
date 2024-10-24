#!/bin/bash
git clone https://github.com/FedoraQt/QGnomePlatform.git
cd QGnomePlatform
mkdir build
cd build
make
sudo make install
