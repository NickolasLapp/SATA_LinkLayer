
-------------------------------------------------------------------------------
-- Copyright (C) 2009 OutputLogic.com 
-- This source file may be used and distributed without restriction 
-- provided that this copyright statement is not removed from the file 
-- and that any derivative work contains the original copyright notice 
-- and the associated disclaimer. 
-- 
-- THIS SOURCE FILE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS 
-- OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED	
-- WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE. 
-------------------------------------------------------------------------------
-- scrambler module for data(31:0)
--   lfsr(15:0)=1+x^4+x^13+x^15+x^16;
-------------------------------------------------------------------------------
library ieee; 
use ieee.std_logic_1164.all;

entity scrambler is 
  port ( data_in : in std_logic_vector (31 downto 0);
    scram_en, scram_rst , rst, clk : in std_logic;
    data_out : out std_logic_vector (31 downto 0));
end scrambler;

architecture scrambler_arch of scrambler is	
  signal data_c: std_logic_vector (31 downto 0);	
  signal lfsr_q: std_logic_vector (15 downto 0);	
  signal lfsr_c: std_logic_vector (15 downto 0);	
begin	
    lfsr_c(0) <= lfsr_q(0) xor lfsr_q(5) xor lfsr_q(6) xor lfsr_q(7) xor lfsr_q(10) xor lfsr_q(11) xor lfsr_q(12) xor lfsr_q(14) xor lfsr_q(15);
    lfsr_c(1) <= lfsr_q(0) xor lfsr_q(1) xor lfsr_q(6) xor lfsr_q(7) xor lfsr_q(8) xor lfsr_q(11) xor lfsr_q(12) xor lfsr_q(13) xor lfsr_q(15);
    lfsr_c(2) <= lfsr_q(1) xor lfsr_q(2) xor lfsr_q(7) xor lfsr_q(8) xor lfsr_q(9) xor lfsr_q(12) xor lfsr_q(13) xor lfsr_q(14);
    lfsr_c(3) <= lfsr_q(2) xor lfsr_q(3) xor lfsr_q(8) xor lfsr_q(9) xor lfsr_q(10) xor lfsr_q(13) xor lfsr_q(14) xor lfsr_q(15);
    lfsr_c(4) <= lfsr_q(3) xor lfsr_q(4) xor lfsr_q(5) xor lfsr_q(6) xor lfsr_q(7) xor lfsr_q(9) xor lfsr_q(12);
    lfsr_c(5) <= lfsr_q(4) xor lfsr_q(5) xor lfsr_q(6) xor lfsr_q(7) xor lfsr_q(8) xor lfsr_q(10) xor lfsr_q(13);
    lfsr_c(6) <= lfsr_q(5) xor lfsr_q(6) xor lfsr_q(7) xor lfsr_q(8) xor lfsr_q(9) xor lfsr_q(11) xor lfsr_q(14);
    lfsr_c(7) <= lfsr_q(0) xor lfsr_q(6) xor lfsr_q(7) xor lfsr_q(8) xor lfsr_q(9) xor lfsr_q(10) xor lfsr_q(12) xor lfsr_q(15);
    lfsr_c(8) <= lfsr_q(1) xor lfsr_q(7) xor lfsr_q(8) xor lfsr_q(9) xor lfsr_q(10) xor lfsr_q(11) xor lfsr_q(13);
    lfsr_c(9) <= lfsr_q(2) xor lfsr_q(8) xor lfsr_q(9) xor lfsr_q(10) xor lfsr_q(11) xor lfsr_q(12) xor lfsr_q(14);
    lfsr_c(10) <= lfsr_q(3) xor lfsr_q(9) xor lfsr_q(10) xor lfsr_q(11) xor lfsr_q(12) xor lfsr_q(13) xor lfsr_q(15);
    lfsr_c(11) <= lfsr_q(0) xor lfsr_q(4) xor lfsr_q(10) xor lfsr_q(11) xor lfsr_q(12) xor lfsr_q(13) xor lfsr_q(14);
    lfsr_c(12) <= lfsr_q(1) xor lfsr_q(5) xor lfsr_q(11) xor lfsr_q(12) xor lfsr_q(13) xor lfsr_q(14) xor lfsr_q(15);
    lfsr_c(13) <= lfsr_q(2) xor lfsr_q(5) xor lfsr_q(7) xor lfsr_q(10) xor lfsr_q(11) xor lfsr_q(13);
    lfsr_c(14) <= lfsr_q(3) xor lfsr_q(6) xor lfsr_q(8) xor lfsr_q(11) xor lfsr_q(12) xor lfsr_q(14);
    lfsr_c(15) <= lfsr_q(4) xor lfsr_q(5) xor lfsr_q(6) xor lfsr_q(9) xor lfsr_q(10) xor lfsr_q(11) xor lfsr_q(13) xor lfsr_q(14);

    data_c(0) <= data_in(0) xor lfsr_q(15);
    data_c(1) <= data_in(1) xor lfsr_q(14) xor lfsr_q(15);
    data_c(2) <= data_in(2) xor lfsr_q(13) xor lfsr_q(14) xor lfsr_q(15);
    data_c(3) <= data_in(3) xor lfsr_q(12) xor lfsr_q(13) xor lfsr_q(14);
    data_c(4) <= data_in(4) xor lfsr_q(11) xor lfsr_q(12) xor lfsr_q(13) xor lfsr_q(15);
    data_c(5) <= data_in(5) xor lfsr_q(10) xor lfsr_q(11) xor lfsr_q(12) xor lfsr_q(14);
    data_c(6) <= data_in(6) xor lfsr_q(9) xor lfsr_q(10) xor lfsr_q(11) xor lfsr_q(13);
    data_c(7) <= data_in(7) xor lfsr_q(8) xor lfsr_q(9) xor lfsr_q(10) xor lfsr_q(12) xor lfsr_q(15);
    data_c(8) <= data_in(8) xor lfsr_q(7) xor lfsr_q(8) xor lfsr_q(9) xor lfsr_q(11) xor lfsr_q(14) xor lfsr_q(15);
    data_c(9) <= data_in(9) xor lfsr_q(6) xor lfsr_q(7) xor lfsr_q(8) xor lfsr_q(10) xor lfsr_q(13) xor lfsr_q(14) xor lfsr_q(15);
    data_c(10) <= data_in(10) xor lfsr_q(5) xor lfsr_q(6) xor lfsr_q(7) xor lfsr_q(9) xor lfsr_q(12) xor lfsr_q(13) xor lfsr_q(14);
    data_c(11) <= data_in(11) xor lfsr_q(4) xor lfsr_q(5) xor lfsr_q(6) xor lfsr_q(8) xor lfsr_q(11) xor lfsr_q(12) xor lfsr_q(13) xor lfsr_q(15);
    data_c(12) <= data_in(12) xor lfsr_q(3) xor lfsr_q(4) xor lfsr_q(5) xor lfsr_q(7) xor lfsr_q(10) xor lfsr_q(11) xor lfsr_q(12) xor lfsr_q(14) xor lfsr_q(15);
    data_c(13) <= data_in(13) xor lfsr_q(2) xor lfsr_q(3) xor lfsr_q(4) xor lfsr_q(6) xor lfsr_q(9) xor lfsr_q(10) xor lfsr_q(11) xor lfsr_q(13) xor lfsr_q(14);
    data_c(14) <= data_in(14) xor lfsr_q(1) xor lfsr_q(2) xor lfsr_q(3) xor lfsr_q(5) xor lfsr_q(8) xor lfsr_q(9) xor lfsr_q(10) xor lfsr_q(12) xor lfsr_q(13);
    data_c(15) <= data_in(15) xor lfsr_q(0) xor lfsr_q(1) xor lfsr_q(2) xor lfsr_q(4) xor lfsr_q(7) xor lfsr_q(8) xor lfsr_q(9) xor lfsr_q(11) xor lfsr_q(12) xor lfsr_q(15);
    data_c(16) <= data_in(16) xor lfsr_q(0) xor lfsr_q(1) xor lfsr_q(3) xor lfsr_q(6) xor lfsr_q(7) xor lfsr_q(8) xor lfsr_q(10) xor lfsr_q(11) xor lfsr_q(14) xor lfsr_q(15);
    data_c(17) <= data_in(17) xor lfsr_q(0) xor lfsr_q(2) xor lfsr_q(5) xor lfsr_q(6) xor lfsr_q(7) xor lfsr_q(9) xor lfsr_q(10) xor lfsr_q(13) xor lfsr_q(14);
    data_c(18) <= data_in(18) xor lfsr_q(1) xor lfsr_q(4) xor lfsr_q(5) xor lfsr_q(6) xor lfsr_q(8) xor lfsr_q(9) xor lfsr_q(12) xor lfsr_q(13);
    data_c(19) <= data_in(19) xor lfsr_q(0) xor lfsr_q(3) xor lfsr_q(4) xor lfsr_q(5) xor lfsr_q(7) xor lfsr_q(8) xor lfsr_q(11) xor lfsr_q(12);
    data_c(20) <= data_in(20) xor lfsr_q(2) xor lfsr_q(3) xor lfsr_q(4) xor lfsr_q(6) xor lfsr_q(7) xor lfsr_q(10) xor lfsr_q(11);
    data_c(21) <= data_in(21) xor lfsr_q(1) xor lfsr_q(2) xor lfsr_q(3) xor lfsr_q(5) xor lfsr_q(6) xor lfsr_q(9) xor lfsr_q(10) xor lfsr_q(15);
    data_c(22) <= data_in(22) xor lfsr_q(0) xor lfsr_q(1) xor lfsr_q(2) xor lfsr_q(4) xor lfsr_q(5) xor lfsr_q(8) xor lfsr_q(9) xor lfsr_q(14) xor lfsr_q(15);
    data_c(23) <= data_in(23) xor lfsr_q(0) xor lfsr_q(1) xor lfsr_q(3) xor lfsr_q(4) xor lfsr_q(7) xor lfsr_q(8) xor lfsr_q(13) xor lfsr_q(14) xor lfsr_q(15);
    data_c(24) <= data_in(24) xor lfsr_q(0) xor lfsr_q(2) xor lfsr_q(3) xor lfsr_q(6) xor lfsr_q(7) xor lfsr_q(12) xor lfsr_q(13) xor lfsr_q(14);
    data_c(25) <= data_in(25) xor lfsr_q(1) xor lfsr_q(2) xor lfsr_q(5) xor lfsr_q(6) xor lfsr_q(11) xor lfsr_q(12) xor lfsr_q(13);
    data_c(26) <= data_in(26) xor lfsr_q(0) xor lfsr_q(1) xor lfsr_q(4) xor lfsr_q(5) xor lfsr_q(10) xor lfsr_q(11) xor lfsr_q(12) xor lfsr_q(15);
    data_c(27) <= data_in(27) xor lfsr_q(0) xor lfsr_q(3) xor lfsr_q(4) xor lfsr_q(9) xor lfsr_q(10) xor lfsr_q(11) xor lfsr_q(14) xor lfsr_q(15);
    data_c(28) <= data_in(28) xor lfsr_q(2) xor lfsr_q(3) xor lfsr_q(8) xor lfsr_q(9) xor lfsr_q(10) xor lfsr_q(13) xor lfsr_q(14) xor lfsr_q(15);
    data_c(29) <= data_in(29) xor lfsr_q(1) xor lfsr_q(2) xor lfsr_q(7) xor lfsr_q(8) xor lfsr_q(9) xor lfsr_q(12) xor lfsr_q(13) xor lfsr_q(14);
    data_c(30) <= data_in(30) xor lfsr_q(0) xor lfsr_q(1) xor lfsr_q(6) xor lfsr_q(7) xor lfsr_q(8) xor lfsr_q(11) xor lfsr_q(12) xor lfsr_q(13) xor lfsr_q(15);
    data_c(31) <= data_in(31) xor lfsr_q(0) xor lfsr_q(5) xor lfsr_q(6) xor lfsr_q(7) xor lfsr_q(10) xor lfsr_q(11) xor lfsr_q(12) xor lfsr_q(14) xor lfsr_q(15);

    process (clk,rst) begin 
      if (rst = '0') then 
        lfsr_q <= b"1111111111111111";
        data_out <= b"00000000000000000000000000000000";
      elsif (clk'EVENT and clk = '1') then 
        if (scram_rst = '0') then 
          lfsr_q <= b"1111111111111111";
        elsif (scram_en = '1') then 
          lfsr_q <= lfsr_c; 
       	end if; 

        if (scram_en = '1') then 
          data_out <= data_c; 
       	end if; 
      end if; 
    end process; 
end architecture scrambler_arch; 