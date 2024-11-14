### Actions-OpenWrt | OpenWRT 编译

基于`https://github.com/P3TERX/Actions-OpenWrt/`创建的OpenWRT编译工作流

包含的编译流
- `Lean OpenWRT`
  `repoURL`: https://github.com/coolsnowwolf/lede
  编译工作流：`build-device`,支持按设备编译,设备`config`文件在`config`目录下

- `ZN-M2`
  `repoURL`: https://github.com/dalianmao09/openwrt-ipq6000.git
  编译工作流：`Build-ZN-M2`

- `360T7`
  `repoURL`: https://github.com/hanwckf/immortalwrt-mt798x.git
  编译工作流：`Build-360T7`
  
- `immortWrt`
  `repoURL`: https://github.com/immortalwrt/immortalwrt.git
  编译工作流：`Build-ImmortalWrt`
  
- `JDC AX1800 Pro`
  `repoURL`: https://github.com/LiBwrt-op/openwrt-6.x.git
  编译工作流：`Super-Builder`
  
> 在使用前,先在本地检出对应仓库`Repo`,在本地创建好设备`config`文件后,推送到仓库，使用云编译