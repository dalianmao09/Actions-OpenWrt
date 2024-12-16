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
  CFG_FILE=configs/templates/$one.config
  if [ ! -f ${CFG_FILE} ] ; then
    echo "${CFG_FILE} not found "
    continue
  fi
  ### 修改配置 START
  sed -i 's/CONFIG_FIRMWARE_INCLUDE_OPENSSL_EXE=n/CONFIG_FIRMWARE_INCLUDE_OPENSSL_EXE=y/g' ${CFG_FILE}
  sed -i 's/CONFIG_FIRMWARE_INCLUDE_ARIA_WEB_CONTROL=y/CONFIG_FIRMWARE_INCLUDE_ARIA_WEB_CONTROL=n/g' ${CFG_FILE}
  sed -i 's/CONFIG_FIRMWARE_INCLUDE_SCUTCLIENT=y/CONFIG_FIRMWARE_INCLUDE_SCUTCLIENT=n/g' ${CFG_FILE}
  sed -i 's/CONFIG_FIRMWARE_INCLUDE_GDUT_DRCOM=y/CONFIG_FIRMWARE_INCLUDE_GDUT_DRCOM=n/g' ${CFG_FILE}
  sed -i 's/CONFIG_FIRMWARE_INCLUDE_DOGCOM=y/CONFIG_FIRMWARE_INCLUDE_DOGCOM=n/g' ${CFG_FILE}
  sed -i 's/CONFIG_FIRMWARE_INCLUDE_MINIEAP=y/CONFIG_FIRMWARE_INCLUDE_MINIEAP=n/g' ${CFG_FILE}
  sed -i 's/CONFIG_FIRMWARE_INCLUDE_NJIT_CLIENT=y/CONFIG_FIRMWARE_INCLUDE_NJIT_CLIENT=n/g' ${CFG_FILE}
  sed -i 's/CONFIG_FIRMWARE_INCLUDE_SOFTETHERVPN_SERVER=y/CONFIG_FIRMWARE_INCLUDE_SOFTETHERVPN_SERVER=n/g' ${CFG_FILE}
  sed -i 's/CONFIG_FIRMWARE_INCLUDE_SOFTETHERVPN_CLIENT=y/CONFIG_FIRMWARE_INCLUDE_SOFTETHERVPN_CLIENT=n/g' ${CFG_FILE}
  sed -i 's/CONFIG_FIRMWARE_INCLUDE_SOFTETHERVPN_CMD=y/CONFIG_FIRMWARE_INCLUDE_SOFTETHERVPN_CMD=n/g' ${CFG_FILE}
  sed -i 's/CONFIG_FIRMWARE_INCLUDE_VLMCSD=y/CONFIG_FIRMWARE_INCLUDE_VLMCSD=n/g' ${CFG_FILE}
  sed -i 's/CONFIG_FIRMWARE_INCLUDE_TTYD=y/CONFIG_FIRMWARE_INCLUDE_TTYD=n/g' ${CFG_FILE}
  sed -i 's/CONFIG_FIRMWARE_INCLUDE_LRZSZ=y/CONFIG_FIRMWARE_INCLUDE_LRZSZ=n/g' ${CFG_FILE}
  sed -i 's/CONFIG_FIRMWARE_INCLUDE_HTOP=y/CONFIG_FIRMWARE_INCLUDE_HTOP=n/g' ${CFG_FILE}
  sed -i 's/CONFIG_FIRMWARE_INCLUDE_NANO=y/CONFIG_FIRMWARE_INCLUDE_NANO=n/g' ${CFG_FILE}
  sed -i 's/CONFIG_FIRMWARE_INCLUDE_DUMP1090=y/CONFIG_FIRMWARE_INCLUDE_DUMP1090=n/g' ${CFG_FILE}
  sed -i 's/CONFIG_FIRMWARE_INCLUDE_RTL_SDR=y/CONFIG_FIRMWARE_INCLUDE_RTL_SDR=n/g' ${CFG_FILE}
  sed -i 's/CONFIG_FIRMWARE_INCLUDE_MTR=y/CONFIG_FIRMWARE_INCLUDE_MTR=n/g' ${CFG_FILE}
  sed -i 's/CONFIG_FIRMWARE_INCLUDE_SOCAT=y/CONFIG_FIRMWARE_INCLUDE_SOCAT=n/g' ${CFG_FILE}
  sed -i 's/CONFIG_FIRMWARE_INCLUDE_SRELAY=y/CONFIG_FIRMWARE_INCLUDE_SRELAY=n/g' ${CFG_FILE}
  sed -i 's/CONFIG_FIRMWARE_INCLUDE_MENTOHUST=y/CONFIG_FIRMWARE_INCLUDE_MENTOHUST=n/g' ${CFG_FILE}
  sed -i 's/CONFIG_FIRMWARE_INCLUDE_FRPC=y/CONFIG_FIRMWARE_INCLUDE_FRPC=n/g' ${CFG_FILE}
  sed -i 's/CONFIG_FIRMWARE_INCLUDE_FRPS=y/CONFIG_FIRMWARE_INCLUDE_FRPS=n/g' ${CFG_FILE}
  sed -i 's/CONFIG_FIRMWARE_INCLUDE_WIREGUARD=y/CONFIG_FIRMWARE_INCLUDE_WIREGUARD=n/g' ${CFG_FILE}
  sed -i 's/CONFIG_FIRMWARE_INCLUDE_REDSOCKS=y/CONFIG_FIRMWARE_INCLUDE_REDSOCKS=n/g' ${CFG_FILE}
  sed -i 's/CONFIG_FIRMWARE_INCLUDE_CURL=n/CONFIG_FIRMWARE_INCLUDE_CURL=y/g' ${CFG_FILE}
  sed -i 's/CONFIG_FIRMWARE_INCLUDE_IPERF3=n/CONFIG_FIRMWARE_INCLUDE_IPERF3=y/g' ${CFG_FILE}
  ### 修改配置 END
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