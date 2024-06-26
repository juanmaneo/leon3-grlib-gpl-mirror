-- SPI memory controller
  constant CFG_SPIMCTRL             : integer := CONFIG_SPIMCTRL;
  constant CFG_SPIMCTRL_SDCARD      : integer := 0;
  constant CFG_SPIMCTRL_READCMD     : integer := 16#CONFIG_SPIMCTRL_READCMD#;
  constant CFG_SPIMCTRL_DUMMYBYTE   : integer := CONFIG_SPIMCTRL_DUMMYBYTE;
  constant CFG_SPIMCTRL_DUALOUTPUT  : integer := CONFIG_SPIMCTRL_DUALOUTPUT;
  constant CFG_SPIMCTRL_QUADOUTPUT  : integer := CONFIG_SPIMCTRL_QUADOUTPUT;
  constant CFG_SPIMCTRL_DUALINPUT   : integer := CONFIG_SPIMCTRL_DUALINPUT;
  constant CFG_SPIMCTRL_QUADINPUT   : integer := CONFIG_SPIMCTRL_QUADINPUT;
  constant CFG_SPIMCTRL_DSPI        : integer := CONFIG_SPIMCTRL_DSPI;
  constant CFG_SPIMCTRL_QSPI        : integer := CONFIG_SPIMCTRL_QSPI;
  constant CFG_SPIMCTRL_DUMMYCYCLES : integer := CONFIG_SPIMCTRL_DUMMYCYCLES;
  constant CFG_SPIMCTRL_EXTADDR     : integer := CONFIG_SPIMCTRL_EXTADDR;
  constant CFG_SPIMCTRL_RECONF      : integer := CONFIG_SPIMCTRL_RECONF;
  constant CFG_SPIMCTRL_SCALER      : integer := CONFIG_SPIMCTRL_SCALER;
  constant CFG_SPIMCTRL_ASCALER     : integer := CONFIG_SPIMCTRL_ASCALER;
  constant CFG_SPIMCTRL_PWRUPCNT    : integer := CONFIG_SPIMCTRL_PWRUPCNT;
  constant CFG_SPIMCTRL_OFFSET      : integer := 16#CONFIG_SPIMCTRL_OFFSET#;
  constant CFG_SPIMCTRL_WRITECMD    : integer := 16#CONFIG_SPIMCTRL_WRITECMD#;
  constant CFG_SPIMCTRL_ALLOWWRT    : integer := CONFIG_SPIMCTRL_WRITES;
  constant CFG_SPIMCTRL_XIPBYTE     : integer := CONFIG_SPIMCTRL_XIPBYTE;
  constant CFG_SPIMCTRL_XIPPOL      : integer := CONFIG_SPIMCTRL_XIPPOL;
