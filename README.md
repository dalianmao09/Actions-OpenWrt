### Actions-OpenWrt | OpenWRT 编译

基于`https://github.com/P3TERX/Actions-OpenWrt/`创建的OpenWRT编译工作流

包含的编译流
- `Lean OpenWRT`
  `repoURL`: https://github.com/coolsnowwolf/lede
  编译工作流：`build-device`,支持按设备编译,设备`config`文件在`config`目录下

- `IPQ6000`
  `repoURL`: https://github.com/sdf8057/ipq6000.git
  编译工作流：`ipq6000`或者`zn-m2`

- `AX1800`
  `repoURL`: https://github.com/coolsnowwolf/openwrt-gl-ax1800.git
  编译工作流：`zn_cool`

- `360T7`
  `repoURL`: https://github.com/hanwckf/immortalwrt-mt798x.git
  编译工作流：`360-T7`
  
  
> 在使用前,先在本地检出对应仓库`Repo`,在本地创建好设备`config`文件后,推送到仓库，使用云编译