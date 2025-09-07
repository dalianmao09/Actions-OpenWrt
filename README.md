### Actions-OpenWrt | OpenWRT 编译

基于`https://github.com/P3TERX/Actions-OpenWrt/`创建的OpenWRT编译工作流

包含的编译流
- `Lean OpenWRT`
  `repoURL`: https://github.com/coolsnowwolf/lede
  编译工作流：`build-device`,支持按设备编译,设备`config`文件在`config`目录下

- `ZN-M2/JDC AX1800 Pro`
  `repoURL`: https://github.com/dalianmao09/ipq6000
  编译工作流：`Super-Builder`

- `360T7`
  `repoURL`: https://github.com/hanwckf/immortalwrt-mt798x.git
  编译工作流：`Build-360T7`
  
- `immortWrt`
  `repoURL`: https://github.com/immortalwrt/immortalwrt.git
  编译工作流：`Super-Builder`
  
- `JDC AX1800 Pro`
  `repoURL`: https://github.com/LiBwrt-op/openwrt-6.x.git
  编译工作流：`Super-Builder`
  分支:`kernel-6.12`
> 在使用前,先在本地检出对应仓库`Repo`,在本地创建好设备`config`文件后,推送到仓库，使用云编译

- MT7981可选
  `仓库地址`:https://github.com/padavanonly/immortalwrt-mt798x-6.6 , `2410`分支

**配置文件说明**

| 配置文件          | 仓库地址                                              | 代码分支 |
| ----------------- | ----------------------------------------------------- | -------- |
| dlm-360t7.config  | https://github.com/padavanonly/immortalwrt-mt798x-6.6 | 2410     |
| dlm-tr3000.config | https://github.com/padavanonly/immortalwrt-mt798x-6.6 | 2410     |
| dlm-zn.config     | https://github.com/dalianmao09/ipq6000                | ipq6000  |
| h-360t7.config    | https://github.com/hanwckf/immortalwrt-mt798x.git     | 21.02    |
| iwrt-*            | https://github.com/immortalwrt/immortalwrt.git        | *        |
| lean-*            | https://github.com/coolsnowwolf/lede                  | *        |