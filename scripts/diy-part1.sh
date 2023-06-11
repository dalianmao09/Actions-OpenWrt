#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

if [ "$1" == "ZN_M2" ]; then
    echo "Build ZN_M2"
    rm -rf feeds/luci/themes/luci-theme-argon
    git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git feeds/luci/themes/luci-theme-argon
fi

if [ "$1" == "ZN_COOL" ]; then
    echo "Build ZN_COOL"
    sed -i 's#PKG_SOURCE_URL.*#PKG_SOURCE_URL:=https://sources.immortalwrt.org/ipt2socks-$(PKG_VERSION).tar.gz#' package/lean/ipt2socks/Makefile
    rm -rf extra/luci/themes/luci-theme-argon
    git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git extra/luci/themes/luci-theme-argon
fi