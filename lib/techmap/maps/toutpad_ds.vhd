------------------------------------------------------------------------------
--  This file is a part of the GRLIB VHDL IP LIBRARY
--  Copyright (C) 2003 - 2008, Gaisler Research
--  Copyright (C) 2008 - 2010, Aeroflex Gaisler
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 2 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program; if not, write to the Free Software
--  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA 
-----------------------------------------------------------------------------
-- Entity: 	toutpad_ds
-- File:	toutpad_ds.vhd
-- Author:	Jonas Ekergarn - Aeroflex Gaisler
-- Description:	tri-state differential output pad with technology wrapper
------------------------------------------------------------------------------

library techmap;
library ieee;
use ieee.std_logic_1164.all;
use techmap.gencomp.all;
use techmap.allpads.all;

entity toutpad_ds is
  generic (tech : integer := 0; level : integer := 0; slew : integer := 0;
	   voltage : integer := x33v; strength : integer := 12;
	   oepol : integer := 0);
  port (padp, padn : out std_ulogic; i, en : in std_ulogic);
end;

architecture rtl of toutpad_ds is
signal oen : std_ulogic;
signal padx, gnd : std_ulogic;
begin
  gnd <= '0';
  oen <= not en when oepol /= padoen_polarity(tech) else en;
  gen0 : if has_ds_pads(tech) = 0 or (is_unisim(tech) = 1) or
           tech = axcel or tech = axdsp or tech = rhlib18t or
           tech = ut25 
           generate
    padp <= i after 2 ns when oen = '0'
-- pragma translate_off
           else 'X' after 2 ns when is_x(en)
-- pragma translate_on
           else 'Z' after 2 ns;
    padn <= not i after 2 ns when oen = '0'
-- pragma translate_off
           else 'X' after 2 ns when is_x(en)
-- pragma translate_on
           else 'Z' after 2 ns;
  end generate;
  pa : if (tech = apa3) generate
    u0 : apa3_toutpad_ds generic map (level)
      port map (padp, padn, i, oen);
  end generate;
end;

library techmap;
library ieee;
use ieee.std_logic_1164.all;
use techmap.gencomp.all;

entity toutpad_dsv is
  generic (tech : integer := 0; level : integer := 0; slew : integer := 0;
	voltage : integer := x33v; strength : integer := 12; width : integer := 1;
	oepol : integer := 0);
  port (
    padp : out std_logic_vector(width-1 downto 0);
    padn : out std_logic_vector(width-1 downto 0);
    i    : in  std_logic_vector(width-1 downto 0);
    en   : in  std_ulogic);
end;
architecture rtl of toutpad_dsv is
begin
  v : for j in width-1 downto 0 generate
    u0 : toutpad_ds generic map (tech, level, slew, voltage, strength, oepol)
	 port map (padp(j), padn(j), i(j), en);
  end generate;
end;

library techmap;
library ieee;
use ieee.std_logic_1164.all;
use techmap.gencomp.all;

entity toutpad_dsvv is
  generic (tech : integer := 0; level : integer := 0; slew : integer := 0;
	voltage : integer := x33v; strength : integer := 12; width : integer := 1;
	oepol : integer := 0);
  port (
    padp : out std_logic_vector(width-1 downto 0);
    padn : out std_logic_vector(width-1 downto 0);
    i    : in  std_logic_vector(width-1 downto 0);
    en   : in  std_logic_vector(width-1 downto 0));
end;
architecture rtl of toutpad_dsvv is
begin
  v : for j in width-1 downto 0 generate
    u0 : toutpad_ds generic map (tech, level, slew, voltage, strength, oepol)
	 port map (padp(j), padn(j), i(j), en(j));
  end generate;
end;
