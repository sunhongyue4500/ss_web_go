#!/bin/bash
# kill myruirui 容器
docker kill myruirui
# rm myruirui:v0.1 镜像
docker image rm myruirui:v0.1
# 从github上拉最新代码，
git pull https://github.com/sunhongyue4500/ss_web_go.git
# build 镜像
docker build -t myruirui:v0.1 .
# run 容器
docker run --name myruirui  -p 7777:7777 --rm myruirui:v0.1 -d



