# xeno_d_can

Driver for Bosch CCAN and DCAN peripherals ported to RTDM for use with Xenomai.
Based heavily on existing Linux driver for the same hardware. Tested on Beaglebone Black.

Originally all source code for this port was merged into a single C file. 
The driver worked in that configuration, but is currently slightly broken when split up into two C files and a header file in the same manner that the original Linux driver was organized. The driver builds and loads, but the function bindings don't seem to be working at runtime.
