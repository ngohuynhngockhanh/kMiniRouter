cmd_/root/TL-WN727N_V4_150909/Driver/MODULE/os/linux/../../ate/common/rt_qa.o := gcc -Wp,-MD,/root/TL-WN727N_V4_150909/Driver/MODULE/os/linux/../../ate/common/.rt_qa.o.d  -nostdinc -isystem /usr/lib/gcc/arm-linux-gnueabihf/4.9/include -I/usr/src/linux-headers-3.4.112-sun8i/arch/arm/include -Iarch/arm/include/generated -Iinclude  -include /usr/src/linux-headers-3.4.112-sun8i/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-sunxi/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -fno-omit-frame-pointer -mapcs -mno-sched-prolog -fno-ipa-sra -mabi=aapcs-linux -mno-thumb-interwork -funwind-tables -D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm -Wframe-larger-than=1024 -fno-stack-protector -Wno-unused-but-set-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-var-tracking-assignments -pg -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO -DAGGREGATION_SUPPORT -DPIGGYBACK_SUPPORT -DWMM_SUPPORT -DLINUX -Wall -Wstrict-prototypes -Wno-trigraphs -DSYSTEM_LOG_SUPPORT -DRT28xx_MODE=STA -DCHIPSET=7601U -DRESOURCE_PRE_ALLOC -I/root/TL-WN727N_V4_150909/Driver/MODULE/include -DCONFIG_STA_SUPPORT -DSCAN_SUPPORT -DDBG -DADHOC_WPA2PSK_SUPPORT -DWPA_SUPPLICANT_SUPPORT -DWSC_STA_SUPPORT -DWSC_V2_SUPPORT -DWSC_LED_SUPPORT -DIWSC_SUPPORT -DRALINK_ATE -DCONFIG_RT2880_ATE_CMD_NEW -I/root/TL-WN727N_V4_150909/Driver/MODULE/ate/include -DRALINK_QA -DDOT11_N_SUPPORT -DSTATS_COUNT_SUPPORT -DIFUP_IN_PROBE -DOS_ABL_SUPPORT -DOS_ABL_FUNC_SUPPORT -DOS_ABL_OS_PCI_SUPPORT -DOS_ABL_OS_USB_SUPPORT -DOS_ABL_OS_AP_SUPPORT -DOS_ABL_OS_STA_SUPPORT -DEXPORT_SYMTAB -DLED_CONTROL_SUPPORT -DMT7601U -DMT7601 -DRLT_MAC -DRLT_RF -DRTMP_MAC_USB -DRTMP_USB_SUPPORT -DRTMP_TIMER_TASK_SUPPORT -DRX_DMA_SCATTER -DVCORECAL_SUPPORT -DRTMP_EFUSE_SUPPORT -DNEW_MBSSID_MODE -DRTMP_INTERNAL_TX_ALC -DCONFIG_ANDES_SUPPORT -DDPD_CALIBRATION_SUPPORT -DANT_DIVERSITY_SUPPORT -DCONFIG_RX_CSO_SUPPORT -DRTMP_FREQ_CALIBRATION_SUPPORT  -DMODULE  -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(rt_qa)"  -D"KBUILD_MODNAME=KBUILD_STR(mt7601Usta)" -c -o /root/TL-WN727N_V4_150909/Driver/MODULE/os/linux/../../ate/common/.tmp_rt_qa.o /root/TL-WN727N_V4_150909/Driver/MODULE/os/linux/../../ate/common/rt_qa.c

source_/root/TL-WN727N_V4_150909/Driver/MODULE/os/linux/../../ate/common/rt_qa.o := /root/TL-WN727N_V4_150909/Driver/MODULE/os/linux/../../ate/common/rt_qa.c

deps_/root/TL-WN727N_V4_150909/Driver/MODULE/os/linux/../../ate/common/rt_qa.o := \
    $(wildcard include/config/rt2880/ate/cmd/new.h) \
    $(wildcard include/config/ap/support.h) \
    $(wildcard include/config/sta/support.h) \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/rt_config.h \
    $(wildcard include/config/h//.h) \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/rtmp_comm.h \
    $(wildcard include/config/opmode/on/ap.h) \
    $(wildcard include/config/opmode/on/sta.h) \
    $(wildcard include/config/if/opmode/on/ap.h) \
    $(wildcard include/config/if/opmode/on/sta.h) \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/rtmp_type.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/rtmp_os.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/os/rt_drv.h \
    $(wildcard include/config/multi/channel.h) \
    $(wildcard include/config/cso/support.h) \
    $(wildcard include/config/rx/cso/support.h) \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/os/rt_linux_cmm.h \
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
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/link_list.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/rtmp_cmd.h \
    $(wildcard include/config/apsta/mixed/support.h) \
    $(wildcard include/config/pm.h) \
    $(wildcard include/config/value.h) \
    $(wildcard include/config/init.h) \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/iface/iface_util.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/rtmp_def.h \
    $(wildcard include/config/desp/entry/size.h) \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/oid.h \
    $(wildcard include/config/status.h) \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/rtmp_chip.h \
    $(wildcard include/config/andes/support.h) \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/mac_ral/pbf.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/mac_ral/nmac/ral_nmac_pbf.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/eeprom.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/mac_ral/rtmp_mac.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/mac_ral/nmac/ral_nmac.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/rtmp_type.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/mac_ral/omac/ral_omac_rxwi.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/mac_ral/nmac/ral_nmac_txwi.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/mac_ral/mac_usb.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/mac_ral/nmac/ral_nmac_usb.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/mac_ral/rtmp_mac.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/chip/rtmp_phy.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/mac_ral/rf_ctrl.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/phy/rlt_phy.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/rtmp_iface.h \
    $(wildcard include/config/.h) \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/iface/rtmp_usb.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/rtusb_io.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/wpa_cmm.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/dot11i_wpa.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/rtmp_dot11.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/rtmp_mcu.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/chip/mt7601.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/rtmp_timer.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/mlme.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/rtmp_dot11.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/crypt_md5.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/crypt_sha2.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/crypt_hmac.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/rt_config.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/crypt_aes.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/crypt_arc4.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/rtmp.h \
    $(wildcard include/config/t.h) \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/spectrum_def.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/wsc.h \
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
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/drs_extr.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/rtmp_M51.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/rtmp_and.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/radar.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/rt_led.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/frq_cal.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/ate/include/rt_ate.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/ap.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/wpa.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/chlist.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/spectrum.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/rt_os_util.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/rt_os_net.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/chip/chip_id.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/ate/include/rt_qa.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/ate/include/rt_ate.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/crypt_biginteger.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/crypt_dh.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/wsc_tlv.h \
    $(wildcard include/config/error.h) \
    $(wildcard include/config/fail.h) \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/sta_cfg.h \
  /root/TL-WN727N_V4_150909/Driver/MODULE/include/mac_ral/fce.h \

/root/TL-WN727N_V4_150909/Driver/MODULE/os/linux/../../ate/common/rt_qa.o: $(deps_/root/TL-WN727N_V4_150909/Driver/MODULE/os/linux/../../ate/common/rt_qa.o)

$(deps_/root/TL-WN727N_V4_150909/Driver/MODULE/os/linux/../../ate/common/rt_qa.o):
