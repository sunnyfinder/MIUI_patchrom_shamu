#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:9114858:119105cb071284746c879412bc40a657de9394ea; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:8379621:3cc19b533125b39470579ec5b323ee1cf9b4f012 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 119105cb071284746c879412bc40a657de9394ea 9114858 3cc19b533125b39470579ec5b323ee1cf9b4f012:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
