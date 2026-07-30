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
src-git luci https://github.com/coolsnowwolf/luci.git;openwrt-25.12
src-git routing https://github.com/coolsnowwolf/routing
src-git telephony https://github.com/coolsnowwolf/telephony.git
src-git helloworld https://github.com/fw876/helloworld.git
EOF

# LEDE (20251001)
#cat >> feeds.conf.default << EOF
#src-git rtp2httpd https://github.com/stackia/rtp2httpd.git
#src-git packages https://github.com/coolsnowwolf/packages
#src-git luci https://github.com/coolsnowwolf/luci.git;openwrt-23.05
#src-git routing https://github.com/coolsnowwolf/routing
#src-git telephony https://github.com/coolsnowwolf/telephony.git
#src-git helloworld https://github.com/fw876/helloworld.git
#EOF


# LibWrt（v25.12.1）
#cat >> feeds.conf.default << EOF
#src-git helloworld https://github.com/fw876/helloworld.git
#src-git nss_packages https://github.com/qosmio/nss-packages.git
#src-git sqm_scripts_nss https://github.com/qosmio/sqm-scripts-nss.git
#src-git packages https://github.com/immortalwrt/packages.git^e93a938c63124832d549c41da3157e2ec40fbe05
#src-git luci https://github.com/immortalwrt/luci.git^ed7692cb08a953e2e503287e0337c8b548cf4ba5
#src-git routing https://github.com/openwrt/routing.git^76c933906c616a4cdf865611af0a381787bd87b8
#src-git telephony https://github.com/openwrt/telephony.git^2618106d5846a4a542fdf5809f0d3ed228ce439b
#src-git video https://github.com/openwrt/video.git^094bf58da6682f895255a35a84349a79dab4bf95
#EOF
