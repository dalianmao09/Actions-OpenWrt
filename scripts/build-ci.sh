#!/usr/bin/env bash
images_dir=/opt/images
base_dir=/opt/rt-n56u
mkdir -p ${images_dir}

### =============================================================
devices="$1"
echo "Devices:[${devices}]"
IFS=','; read -ra device_array <<< "$devices"
for one in "${device_array[@]}"; do
  echo "******************* build ${one} ******************* "
  cd ${base_dir}/trunk
  ./clear_tree >/dev/null 2>&1 
  fakeroot ./build_firmware_ci ${one}
  if [ $? = 0 ]; then 
    cp -f images/*.trx ${images_dir}/$one.trx; 
  fi
done
### =============================================================

echo "******************* Build Finished ******************* "
ls -l  ${images_dir}
exit 0