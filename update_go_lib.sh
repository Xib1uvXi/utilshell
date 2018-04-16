#!/usr/bin/env bash

# 检查 git
if [ $(which git) == "git not found" ];then
    echo "git not found, please install git or set git to path"
    exit 2
fi

go_path_src=$HOME/go/src/

# 检查GOPATH/src
if [ ! -d ${go_path_src} ];then
    echo "GOPATH/src not found, please create dir: mkdir -p ~/go/src"
    exit 2
fi

# 检查 src 下 golang.org
if [ ! -d ${go_path_src}/golang.org ];then
    # create dir golang.org
    mkdir -p ${go_path_src}/golang.org
fi

x_path=${go_path_src}/golang.org/x

# 检查 golang.org 下 x
if [ ! -d ${x_path} ];then
    # create dir golang.org
    mkdir -p ${x_path}
fi

update_or_clone_x_lib () {

    if [ ! $1 ];then
        echo "error! tell me what you want update or clone"
        exit 2
    fi

    echo "================= $1 ================="
    if [ ! -d ${x_path}/$1 ];then
        # clone net
        cd ${x_path}
        git clone https://github.com/golang/$1.git
    else
        # update net
        cd ${x_path}/$1
        git pull
        cd ${x_path}
    fi
    echo "======================================"
    echo "  "

    return $?
}

# 开始更新或者下载go 官方lib

echo "开始更新或者下载golang官方lib， 请耐心等待"
echo "  "

#update_or_clone_x_lib

## net
update_or_clone_x_lib net

## tools
update_or_clone_x_lib tools

## text
update_or_clone_x_lib text

## sys
update_or_clone_x_lib sys

## lint
update_or_clone_x_lib lint

## crypto
update_or_clone_x_lib crypto

## time
update_or_clone_x_lib "time"

## perf
update_or_clone_x_lib perf

## review
update_or_clone_x_lib review

## image
update_or_clone_x_lib image

echo "================= finish ================="




