#!/usr/bin/bash
MY_REPO_BASE=registry.cn-hangzhou.aliyuncs.com/dalianmao
imgList="$1"
skopeo copy docker://docker.io/${imgList} docker://${MY_REPO_BASE}/${imgList}

# echo $imgList
# array=(${imgList//|/ })
# for img in ${array[@]}
# do
# echo "$img"
# # 
# done
