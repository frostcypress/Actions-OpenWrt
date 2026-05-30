
# 欢迎使用云端编译OpenWrt

此代码是使用P3TERX源码，基于自己想法修改的，因能力有限，如使用过程有其他bug，请见谅！

## 使用方法

- 右上角点击 Fork
- 在 Repository name 栏目中填写你的自定义仓库名(其他不用改)，然后点 Create repository
 
- 创建后需要开启权限，在页面的 Settings - Actions - General - Workflow permissions 页面中，然后鼠标拉到
- 最下面，点选 Read and write permissions，勾上 Allow GitHub Actions to create and approve pull requests
- 最后点 Save 即可
-  
- 在仓库页面中（一般修改以下4项即可）
- Part0_Global.env 是全局变量，可按需调整
- Part1_Feeds.sh 是软件源地址，可按需添加
- Part2_Custom.sh 是自定义配置，可按需修改
- configs 里面的是型号插件配置文件，可以借鉴其他人的或者AI生成也行
- 
- 在 Actions 页面选择 Build ，然后点击右边的 Run workflow 编译任务
- 可修改 Update.yml 中的 - cron: '* * * * *' 设置相应的定时更新计划
- 编译完成后，在 Actions 或 Releases 页面下载固件镜像

## 编译方式

- 完整编译：每次固件编译时间一般需要1小时以上
- 矩阵编译：可同时编译多个固件，编译上限自行测试

## 编译加速

- 全局开启编译加速，首次编译生成缓存，二次编译自动提速；
- 免费缓存共 10G，建议单次同时编译固件不超过 2 个；
- 缓存数量、剩余空间会影响加速效果，可自行研究调试；
- 编译速度整体提升 10% 以上，效果受型号、插件影响；
- 缓存引发固件问题时，前往 Action - Caches 清空缓存，重新完整编译。

## 致谢 / 项目引用

- [P3TERX/Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt)
- [GitHub Actions](https://github.com/features/actions)
- [Actions](https://github.com/actions)
- [coolsnowwolf/lede](https://github.com/coolsnowwolf/lede)
- [immortalwrt/immortalwrt](https://github.com/immortalwrt/immortalwrt)
