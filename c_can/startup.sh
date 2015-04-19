
# this obviously properly muxes only can1
# not sure how to config-pin the pins for can0
# looks like config-pin is missing the pins for can0

config-pin overlay cape-universal
config-pin P9.24 can
config-pin P9.26 can

# load the rtcan mods
modprobe xeno_can
modprobe rtcan_can

# start the rtcan interfaces

rtcanconfig rtcan0 -b 1000000 start
rtcanconfig rtcan1 -b 1000000 start

#  rtcansend rtcan1 --verbose --identifier=0x1  0x04 0x01 0x00 0x00 0x0f 0xff
