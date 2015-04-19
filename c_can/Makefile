ifneq ($(VERSION).$(PATCHLEVEL),2.4)

# Makefile frag for Linux v2.6 and v3.x

EXTRA_CFLAGS += -D__IN_XENOMAI__ -D__KERNEL__ \
 -I/usr/src/linux-headers-$(shell uname -r)/include/xenomai/ \
	-I/home/mah/xenomai-2.6/ksrc/drivers/can


KDIR := /lib/modules/$(shell uname -r)/build PWD := $(shell pwd)

obj-m := rtcan_can.o
rtcan_can-objs := rtcan_c_can_platform.o rtcan_c_can.o

KDIR := /lib/modules/$(shell uname -r)/build

PWD := $(shell pwd)

default:
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) ARCH=arm  modules
clean:
	rm -rf *.mod.c *.ko *.o *.symvers *.order

install: rtcan_can.ko
	cp rtcan_can.ko /lib/modules/$(shell uname -r)/kernel/drivers/xenomai/can
	depmod -a
else

# Makefile frag for Linux v2.4

O_TARGET := built-in.o

obj-$(CONFIG_XENO_DRIVERS_CAN_CCAN) += xeno_can_c_can.o 

list-multi := xeno_can_c_can.o 

xeno_can_c_can-objs := rtcan_c_can.o rtcan_c_can_platform.o


export-objs := $(xeno_can_c_can-objs)

EXTRA_CFLAGS += -D__IN_XENOMAI__ -I$(TOPDIR)/include/xenomai -I$(TOPDIR)/include/xenomai/compat -I..  -I.

include $(TOPDIR)/Rules.make

xeno_can_c_can.o: $(xeno_can_c_can-objs)
	$(LD) -r -o $@ $(xeno_can_c_can-objs)

endif
