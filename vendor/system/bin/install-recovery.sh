#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 10907648 54b65b1b5d4a197b9b843cf2d41b77442dd131ff 8620032 39649057d63e84223e18e4a359b7340965da0336
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:10907648:54b65b1b5d4a197b9b843cf2d41b77442dd131ff; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:8620032:39649057d63e84223e18e4a359b7340965da0336 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 54b65b1b5d4a197b9b843cf2d41b77442dd131ff 10907648 39649057d63e84223e18e4a359b7340965da0336:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
