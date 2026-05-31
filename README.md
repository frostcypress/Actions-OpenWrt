
# 欢迎使用云端编译OpenWrt

本项目基于 [P3TERX](https://github.com/P3TERX/Actions-OpenWrt) 源码修改，能力有限，如有 bug 还请见谅 ! ! !

## 使用方法

1.点击右上角 `Fork`，填写 `Repository name` 后点击 `Create repository`

2.配置工作流权限（关键步骤）

- 进入 `Settings → Actions → General → Workflow permissions`
- 选择 `Read and write permissions`
- 勾选 `Allow GitHub Actions to create and approve pull requests`
- 点击 `Save` 保存配置，为自动化流程启用必要权限

3.按需修改仓库关键配置文件

- `Part0_Global.env`：全局编译变量
- `Part1_Feeds.sh`：软件源地址配置
- `Part2_Custom.sh`：自定义固件配置
- `configs/`：设备型号插件配置

4.进入 `Actions` 页面，选择 `Build` 工作流，点击 `Run workflow` 开始编译

5.编译完成后，前往 `Actions` 或 `Releases` 页面下载固件镜像

## 编译方式

Build

- 完整编译：单次固件编译耗时通常在 1 小时以上
- 矩阵编译：支持同时编译多个固件，并发上限可自行测试

Update

- 通过源码哈希对比，自动判断是否编译
- 定时更新可修改 `Update.yml` 的 `cron` 表达式

## 注意事项

- 全局开启编译加速，首次编译生成缓存，二次编译自动提速；
- 免费缓存共 10G，建议单次同时编译固件不超过 2 个；
- 缓存数量、剩余空间会影响加速效果，可自行研究调试；
- 编译速度整体提升 10% 以上，效果受型号、插件影响；
- 缓存引发固件问题时，前往 `Action → Caches` 清空缓存，重新完整编译。

## 项目引用

- [Actions](https://github.com/actions)
- [coolsnowwolf/lede](https://github.com/coolsnowwolf/lede)
- [immortalwrt/immortalwrt](https://github.com/immortalwrt/immortalwrt)
- [P3TERX/Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt)
