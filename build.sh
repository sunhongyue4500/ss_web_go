#!/bin/bash
# kill myruirui 容器
DOCKER_IMAGE="myruirui:v0.1"
DOCKER_CONTAINER="myruirui"
REPO="https://github.com/sunhongyue4500/ss_web_go.git"

# kill
str=`docker ps | grep $DOCKER_CONTAINER | wc -l`
# echo $str
if [ $str -eq 1 ]; then
        docker kill $DOCKER_CONTAINER
fi

# rm myruirui:v0.1 镜像
str=`docker image ls | grep $DOCKER_IMAGE | wc -l`
# echo $str
if [ $str -eq 1 ]; then
        docker image rm $DOCKER_IMAGE
fi

# 从github上拉最新代码，
git pull $REPO
# build 镜像
docker build -t $DOCKER_IMAGE .
# run 容器
docker run --name $DOCKER_CONTAINER  -p 7777:7777 --rm $DOCKER_IMAGE -d



