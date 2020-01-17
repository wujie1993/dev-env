#!/bin/sh

BASE_DIR=$(pwd)

yum install -y git

cd $BASE_DIR/golang/
sh ./install.sh
cd $BASE_DIR/

cd $BASE_DIR/vim/
sh ./install.sh
cd $BASE_DIR/
