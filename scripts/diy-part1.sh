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
# echo 'src-git helloworld https://github.com/fw876/helloworld;main' >>feeds.conf.default
# echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

if [ "$1" == "LEAN" ]; then
    echo "Build From Lean wrt"
    echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#    rm -rf feeds/luci/themes/luci-theme-argon
#    git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git feeds/luci/themes/luci-theme-argon
fi

if [ "$1" == "IWRT" ]; then
    echo "Build From immortalwrt"
    echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
fi