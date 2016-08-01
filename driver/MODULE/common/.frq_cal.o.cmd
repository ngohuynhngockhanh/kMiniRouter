cmd_/home/ksp/kMiniRouter/driver/MODULE/os/linux/../../common/frq_cal.o := gcc -Wp,-MD,/home/ksp/kMiniRouter/driver/MODULE/os/linux/../../common/.frq_cal.o.d  -nostdinc -isystem /usr/lib/gcc/arm-linux-gnueabihf/4.9/include -I/usr/src/linux-headers-3.4.112-sun8i/arch/arm/include -Iarch/arm/include/generated -Iinclude  -include /usr/src/linux-headers-3.4.112-sun8i/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-sunxi/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -fno-omit-frame-pointer -mapcs -mno-sched-prolog -fno-ipa-sra -mabi=aapcs-linux -mno-thumb-interwork -funwind-tables -D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm -Wframe-larger-than=1024 -fno-stack-protector -Wno-unused-but-set-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-var-tracking-assignments -pg -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO -DAGGREGATION_SUPPORT -DPIGGYBACK_SUPPORT -DWMM_SUPPORT -DLINUX -Wall -Wstrict-prototypes -Wno-trigraphs -DSYSTEM_LOG_SUPPORT -DRT28xx_MODE=STA -DCHIPSET=7601U -DRESOURCE_PRE_ALLOC -I/home/ksp/kMiniRouter/driver/MODULE/include -DCONFIG_STA_SUPPORT -DSCAN_SUPPORT -DDBG -DADHOC_WPA2PSK_SUPPORT -DWPA_SUPPLICANT_SUPPORT -DWSC_STA_SUPPORT -DWSC_V2_SUPPORT -DWSC_LED_SUPPORT -DIWSC_SUPPORT -DRALINK_ATE -DCONFIG_RT2880_ATE_CMD_NEW -I/home/ksp/kMiniRouter/driver/MODULE/ate/include -DRALINK_QA -DDOT11_N_SUPPORT -DSTATS_COUNT_SUPPORT -DIFUP_IN_PROBE -DOS_ABL_SUPPORT -DOS_ABL_FUNC_SUPPORT -DOS_ABL_OS_PCI_SUPPORT -DOS_ABL_OS_USB_SUPPORT -DOS_ABL_OS_AP_SUPPORT -DOS_ABL_OS_STA_SUPPORT -DEXPORT_SYMTAB -DLED_CONTROL_SUPPORT -DMT7601U -DMT7601 -DRLT_MAC -DRLT_RF -DRTMP_MAC_USB -DRTMP_USB_SUPPORT -DRTMP_TIMER_TASK_SUPPORT -DRX_DMA_SCATTER -DVCORECAL_SUPPORT -DRTMP_EFUSE_SUPPORT -DNEW_MBSSID_MODE -DRTMP_INTERNAL_TX_ALC -DCONFIG_ANDES_SUPPORT -DDPD_CALIBRATION_SUPPORT -DANT_DIVERSITY_SUPPORT -DCONFIG_RX_CSO_SUPPORT -DRTMP_FREQ_CALIBRATION_SUPPORT  -DMODULE  -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(frq_cal)"  -D"KBUILD_MODNAME=KBUILD_STR(mt7601Usta)" -c -o /home/ksp/kMiniRouter/driver/MODULE/os/linux/../../common/.tmp_frq_cal.o /home/ksp/kMiniRouter/driver/MODULE/os/linux/../../common/frq_cal.c

source_/home/ksp/kMiniRouter/driver/MODULE/os/linux/../../common/frq_cal.o := /home/ksp/kMiniRouter/driver/MODULE/os/linux/../../common/frq_cal.c

deps_/home/ksp/kMiniRouter/driver/MODULE/os/linux/../../common/frq_cal.o := \
  /home/ksp/kMiniRouter/driver/MODULE/include/rt_config.h \
    $(wildcard include/config/h//.h) \
    $(wildcard include/config/ap/support.h) \
    $(wildcard include/config/sta/support.h) \
  /home/ksp/kMiniRouter/driver/MODULE/include/rtmp_comm.h \
    $(wildcard include/config/opmode/on/ap.h) \
    $(wildcard include/config/opmode/on/sta.h) \
    $(wildcard include/config/if/opmode/on/ap.h) \
    $(wildcard include/config/if/opmode/on/sta.h) \
  /home/ksp/kMiniRouter/driver/MODULE/include/rtmp_type.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/rtmp_os.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/os/rt_drv.h \
    $(wildcard include/config/multi/channel.h) \
    $(wildcard include/config/cso/support.h) \
    $(wildcard include/config/rx/cso/support.h) \
  /home/ksp/kMiniRouter/driver/MODULE/include/os/rt_linux_cmm.h \
  include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
  include/linux/compiler.h \
    $(wildcard include/config/sparse/rcu/pointer.h) \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
  include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
  include/linux/compiler-gcc4.h \
  include/linux/types.h \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbdaf.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
    $(wildcard include/config/64bit.h) \
  /usr/src/linux-headers-3.4.112-sun8i/arch/arm/include/asm/types.h \
  include/asm-generic/int-ll64.h \
  arch/arm/include/generated/asm/bitsperlong.h \
  include/asm-generic/bitsperlong.h \
  include/linux/posix_types.h \
  include/linux/stddef.h \
  /usr/src/linux-headers-3.4.112-sun8i/arch/arm/include/asm/posix_types.h \
  include/asm-generic/posix_types.h \
  /usr/lib/gcc/arm-linux-gnueabihf/4.9/include/stdarg.h \
  /usr/src/linux-headers-3.4.112-sun8i/arch/arm/include/asm/string.h \
  include/linux/ctype.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/link_list.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/rtmp_cmd.h \
    $(wildcard include/config/apsta/mixed/support.h) \
    $(wildcard include/config/pm.h) \
    $(wildcard include/config/value.h) \
    $(wildcard include/config/init.h) \
  /home/ksp/kMiniRouter/driver/MODULE/include/iface/iface_util.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/rtmp_def.h \
    $(wildcard include/config/desp/entry/size.h) \
  /home/ksp/kMiniRouter/driver/MODULE/include/oid.h \
    $(wildcard include/config/status.h) \
  /home/ksp/kMiniRouter/driver/MODULE/include/rtmp_chip.h \
    $(wildcard include/config/andes/support.h) \
  /home/ksp/kMiniRouter/driver/MODULE/include/mac_ral/pbf.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/mac_ral/nmac/ral_nmac_pbf.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/eeprom.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/mac_ral/rtmp_mac.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/mac_ral/nmac/ral_nmac.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/rtmp_type.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/mac_ral/omac/ral_omac_rxwi.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/mac_ral/nmac/ral_nmac_txwi.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/mac_ral/mac_usb.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/mac_ral/nmac/ral_nmac_usb.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/mac_ral/rtmp_mac.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/chip/rtmp_phy.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/mac_ral/rf_ctrl.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/phy/rlt_phy.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/rtmp_iface.h \
    $(wildcard include/config/.h) \
  /home/ksp/kMiniRouter/driver/MODULE/include/iface/rtmp_usb.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/rtusb_io.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/wpa_cmm.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/dot11i_wpa.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/rtmp_dot11.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/rtmp_mcu.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/chip/mt7601.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/rtmp_timer.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/mlme.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/rtmp_dot11.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/crypt_md5.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/crypt_sha2.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/crypt_hmac.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/rt_config.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/crypt_aes.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/crypt_arc4.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/rtmp.h \
    $(wildcard include/config/t.h) \
  /home/ksp/kMiniRouter/driver/MODULE/include/spectrum_def.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/wsc.h \
    $(wildcard include/config/req.h) \
    $(wildcard include/config/methods.h) \
    $(wildcard include/config/methods/usba.h) \
    $(wildcard include/config/methods/ethernet.h) \
    $(wildcard include/config/methods/label.h) \
    $(wildcard include/config/methods/display.h) \
    $(wildcard include/config/methods/ent.h) \
    $(wildcard include/config/methods/int.h) \
    $(wildcard include/config/methods/nfci.h) \
    $(wildcard include/config/methods/pbc.h) \
    $(wildcard include/config/methods/keypad.h) \
  /home/ksp/kMiniRouter/driver/MODULE/include/drs_extr.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/rtmp_M51.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/rtmp_and.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/radar.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/rt_led.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/frq_cal.h \
  /home/ksp/kMiniRouter/driver/MODULE/ate/include/rt_ate.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/ap.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/wpa.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/chlist.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/spectrum.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/rt_os_util.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/rt_os_net.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/chip/chip_id.h \
  /home/ksp/kMiniRouter/driver/MODULE/ate/include/rt_qa.h \
  /home/ksp/kMiniRouter/driver/MODULE/ate/include/rt_ate.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/crypt_biginteger.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/crypt_dh.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/wsc_tlv.h \
    $(wildcard include/config/error.h) \
    $(wildcard include/config/fail.h) \
  /home/ksp/kMiniRouter/driver/MODULE/include/sta_cfg.h \
  /home/ksp/kMiniRouter/driver/MODULE/include/mac_ral/fce.h \

/home/ksp/kMiniRouter/driver/MODULE/os/linux/../../common/frq_cal.o: $(deps_/home/ksp/kMiniRouter/driver/MODULE/os/linux/../../common/frq_cal.o)

$(deps_/home/ksp/kMiniRouter/driver/MODULE/os/linux/../../common/frq_cal.o):
