--Function: Full Adder 1 Bit

library ieee;
use ieee.std_logic_1164.all;

entity full_adder_1bit is
port(
	A : in std_logic;
	B : in std_logic;
	carryIn : in std_logic;
	
	adderOut : out std_logic;
	carryOut : out std_logic
);

end full_adder_1bit;

architecture adderLogic of full_adder_1bit is
begin
	carryOut <= ((A) AND (B)) OR ((carryIn) AND ((A) XOR (B)));
	adderOut <= ((A) XOR (B)) XOR (carryIn);
end adderLogic;