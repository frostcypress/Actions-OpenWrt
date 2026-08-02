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
#cat >> feeds.conf.default << EOF
#src-git packages https://github.com/coolsnowwolf/packages
#src-git luci https://github.com/coolsnowwolf/luci.git;openwrt-25.12
#src-git routing https://github.com/coolsnowwolf/routing
#src-git telephony https://github.com/coolsnowwolf/telephony.git
#src-git helloworld https://github.com/fw876/helloworld.git
#EOF

# LEDE (20251001)
#cat >> feeds.conf.default << EOF
#src-git rtp2httpd https://github.com/stackia/rtp2httpd.git;v3.15.3
#src-git packages https://github.com/coolsnowwolf/packages
#src-git luci https://github.com/frostcypress/luci.git;openwrt-23.05
#src-git routing https://github.com/coolsnowwolf/routing
#src-git telephony https://github.com/coolsnowwolf/telephony.git
#src-git helloworld https://github.com/fw876/helloworld.git
#EOF


# LibWrt（25.12-nss）
cat >> feeds.conf.default << EOF
src-git nss_packages https://github.com/qosmio/nss-packages.git
src-git sqm_scripts_nss https://github.com/qosmio/sqm-scripts-nss.git
src-git packages https://github.com/immortalwrt/packages.git;openwrt-25.12
src-git luci https://github.com/immortalwrt/luci.git;openwrt-25.12
src-git routing https://github.com/openwrt/routing.git;openwrt-25.12
src-git telephony https://github.com/openwrt/telephony.git;openwrt-25.12
src-git video https://github.com/openwrt/video.git;openwrt-25.12
EOF
