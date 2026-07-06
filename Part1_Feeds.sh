#!/bin/bash
#
# 文件名字: Part1_Feeds.sh
# 文件说明: 添加软件源 (更新软件源之前执行)
# 使用说明: 把对应注释 "#" 去掉即可启用功能，按需修改或添加参数
#
# Copyright (c) 2026 frostcypress
#

# 清空原有软件源配置（彻底清空）
> feeds.conf.default

# LEDE (master)
cat >> feeds.conf.default << EOF
src-git packages https://github.com/coolsnowwolf/packages
#src-git luci https://github.com/coolsnowwolf/luci
#src-git luci https://github.com/coolsnowwolf/luci.git;openwrt-23.05
#src-git luci https://github.com/coolsnowwolf/luci.git;openwrt-24.10
src-git luci https://github.com/coolsnowwolf/luci.git;openwrt-25.12
src-git routing https://github.com/coolsnowwolf/routing
src-git telephony https://github.com/coolsnowwolf/telephony.git
#src-git helloworld https://github.com/fw876/helloworld.git
#src-git qmodem https://github.com/FUjr/modem_feeds.git
#src-git video https://github.com/openwrt/video.git
#src-git targets https://github.com/openwrt/targets.git
#src-git oldpackages http://git.openwrt.org/packages.git
#src-link custom /usr/src/openwrt/custom-feed
EOF


# LibWrt（25.12-nss）
#cat >> feeds.conf.default << EOF
#src-git nss_packages https://github.com/qosmio/nss-packages.git
#src-git sqm_scripts_nss https://github.com/qosmio/sqm-scripts-nss.git
#src-git packages https://github.com/immortalwrt/packages.git^881bc2200a61801edc8db88e7631f7e6468989a1
#src-git luci https://github.com/immortalwrt/luci.git^a701807e2e0051f342f9980fd85f90f6966af9b0
#src-git routing https://github.com/openwrt/routing.git^b2097c85bef85251364f59a6b2a3ed1f9f5c0c21
#src-git telephony https://github.com/openwrt/telephony.git^2618106d5846a4a542fdf5809f0d3ed228ce439b
#src-git video https://github.com/openwrt/video.git^094bf58da6682f895255a35a84349a79dab4bf95
#EOF
