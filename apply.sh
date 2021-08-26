#!/bin/bash


cmd=$1
cfgs_path='./compose-directive'
files=$(ls "$cfgs_path")


for file in ${files[@]}
do
    # echo "file is $cfgs_path/$file"
    docker-compose -f "$cfgs_path/$file" $1
done