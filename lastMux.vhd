--Function: Last Mux
--Purpose: Differentiates between the carry and the sum, to determine which set of LEDs it should output to
--Libraries used
library ieee;
use ieee.std_logic_1164.all;

--entity declaration
entity lastMux is
port(
	lastMux0, lastMux1 : in std_logic_vector(3 downto 0); --lastMux0 is the carry, lastMux1 is the sum
	selector: in std_logic; --selects between the carry and sum
	result: out std_logic_vector(3 downto 0) --result of between whether to use lastMux0 or lastMux1
);

end lastMux;

architecture lastLogic of lastMux is

--code begins
begin 

	-- for the multiplexing of four hex input busses

	with selector select
	result <= lastMux0 when '0',
					lastMux1 when '1';
end lastLogic;