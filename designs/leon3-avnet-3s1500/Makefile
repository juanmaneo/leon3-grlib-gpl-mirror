GRLIB=../..
TOP=leon3mp
BOARD=avnet-xc3s1500
include $(GRLIB)/boards/$(BOARD)/Makefile.inc
DEVICE=$(PART)-$(PACKAGE)$(SPEED)
#UCF=$(GRLIB)/boards/$(BOARD)/$(TOP).ucf
UCF=$(TOP).ucf
QSF=$(GRLIB)/boards/$(BOARD)/$(TOP).qsf
EFFORT=std
XSTOPT=
SYNPOPT="set_option -pipe 0; set_option -retiming 0; set_option -write_apr_constraint 0"
VHDLSYNFILES=config.vhd mctrl_avnet.vhd leon3mp.vhd
VHDLSIMFILES=testbench.vhd
SIMTOP=testbench
SDCFILE=$(GRLIB)/boards/$(BOARD)/default.sdc
BITGEN=$(GRLIB)/boards/$(BOARD)/default.ut
CLEAN=soft-clean

TECHLIBS = unisim
LIBSKIP = core1553bbc core1553brm core1553brt gr1553 corePCIF \
	tmtc openchip hynix cypress ihp usbhc spw
DIRSKIP = b1553 pci/pcif leon2 leon2ft crypto satcan leon3ft ddr meiko mfpc \
	grusbhc spi spacewire usb leon4v0 l2cache \
	slink ascs pwm gr1553b iommu \
	leon5v0 leon5v0/blockred grfpu5 noelv noelv/subsys riscv
FILESKIP = grcan.vhd pfmddr_wrapper.vhd \
	sf2apbslv_wrapper.vhd sf2ficmst_wrapper.vhd sf2ficslv_wrapper.vhd \
	sf2mddr_wrapper.vhd pfmddr_wrapper.vhd

include $(GRLIB)/software/leon3/Makefile

include $(GRLIB)/bin/Makefile


##################  project specific targets ##########################

