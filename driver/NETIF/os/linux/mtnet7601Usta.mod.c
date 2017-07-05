#include <linux/module.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

MODULE_INFO(vermagic, VERMAGIC_STRING);

struct module __this_module
__attribute__((section(".gnu.linkonce.this_module"))) = {
 .name = KBUILD_MODNAME,
 .init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
 .exit = cleanup_module,
#endif
 .arch = MODULE_ARCH_INIT,
};

static const struct modversion_info ____versions[]
__used
__attribute__((section("__versions"))) = {
	{ 0xac902c3f, "module_layout" },
	{ 0x61e836a8, "RtmpDevPrivFlagsGet" },
	{ 0x98082893, "__copy_to_user" },
	{ 0x2e5810c6, "__aeabi_unwind_cpp_pr1" },
	{ 0x97255bdf, "strlen" },
	{ 0x6cc0821a, "dev_set_drvdata" },
	{ 0xc8b57c27, "autoremove_wake_function" },
	{ 0xa1df5836, "RTMPusecDelay" },
	{ 0x6b1ca381, "netif_carrier_on" },
	{ 0x5befe163, "RtmpOSNetDevFree" },
	{ 0x2a3aa678, "_test_and_clear_bit" },
	{ 0xbab8b2a6, "netif_carrier_off" },
	{ 0x8248f7ec, "RtmpOSNetDevDetach" },
	{ 0xb1ad28e0, "__gnu_mcount_nc" },
	{ 0x6c4836bf, "RT_RateSize" },
	{ 0x91715312, "sprintf" },
	{ 0xe2d5255a, "strcmp" },
	{ 0xda8441a6, "rtstrchr" },
	{ 0x4467122a, "__init_waitqueue_head" },
	{ 0x35b6b772, "param_ops_charp" },
	{ 0xfa2a45e, "__memzero" },
	{ 0x5f754e5a, "memset" },
	{ 0x4c5ee785, "RtmpOsSetNetDevPriv" },
	{ 0xcc3fd46b, "usb_deregister" },
	{ 0x2a8ef6f7, "Rtmp_Drv_Ops_usb" },
	{ 0x27e1a049, "printk" },
	{ 0x71c90087, "memcmp" },
	{ 0x328a05f1, "strncpy" },
	{ 0x16305289, "warn_slowpath_null" },
	{ 0x8e865d3c, "arm_delay_ops" },
	{ 0xd0bfbcea, "RtmpOSNetDevAttach" },
	{ 0x6ab036e9, "module_put" },
	{ 0x9cd55864, "os_free_mem" },
	{ 0xed0734ae, "usb_get_dev" },
	{ 0x2de0dff6, "usb_put_dev" },
	{ 0xd62c833f, "schedule_timeout" },
	{ 0x33ef9726, "ralinkrate" },
	{ 0x9f901ef6, "RtmpOsGetNetDevPriv" },
	{ 0x9d669763, "memcpy" },
	{ 0x757d9021, "RTDebugLevel" },
	{ 0x801678, "flush_scheduled_work" },
	{ 0x32f80ea9, "prepare_to_wait" },
	{ 0x39f5da0f, "RTDebugFunc" },
	{ 0x6023f394, "usb_register_driver" },
	{ 0x20adc8cd, "os_alloc_mem" },
	{ 0xf83178bd, "finish_wait" },
	{ 0x676bbc0f, "_set_bit" },
	{ 0x2aa9868b, "__netif_schedule" },
	{ 0x7b793024, "RTMPFreeNdisPacket" },
	{ 0x49ebacbd, "_clear_bit" },
	{ 0xc14bed20, "dev_get_drvdata" },
	{ 0x8369c654, "try_module_get" },
	{ 0xe914e41e, "strcpy" },
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=mtutil7601Usta,mt7601Usta";

MODULE_ALIAS("usb:v148Fp7650d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v148Fp6370d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v148Fp7601d*dc*dsc*dp*ic*isc*ip*");

MODULE_INFO(srcversion, "B2652578024467A64684B82");
