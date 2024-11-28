#!/usr/bin/env bash
MY_REPO_BASE=registry.cn-hangzhou.aliyuncs.com/dalianmao
images="$1"
echo "Images:[${images}]"
IFS=','; read -ra image_array <<< "$images"
for image in "${image_array[@]}"; do
  image_name=`basename ${image}`
  targetName=${MY_REPO_BASE}/${image_name}
  echo "from [${image_name}] to [${targetName}]"
  docker pull "${image}" --platform "linux/amd64"
  docker tag "${image}" "${targetName}"
  docker push  "${targetName}"
done
echo "Finished"

#src_image=${{ github.event.inputs.srcImage }}
#dest_image=${{ github.event.inputs.destImage }}
#echo "from ${src_image} to ${dest_image}"
#skopeo copy docker://docker.io/${src_image} docker://registry.cn-hangzhou.aliyuncs.com/dalianmao/${dest_image}