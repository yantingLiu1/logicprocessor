-- Function: Logic Processor
-- Purpose: To compute the hex operations for AND, OR, XOR, and XNOR 
-- libraries used
library ieee;
use ieee.std_logic_1164.all;

--entity declaration
entity logic_Processor is
port(
	logic_in0: in std_logic_vector(3 downto 0); --first hex 
	logic_in1 : in std_logic_vector(7 downto 4); --second hex
	logicMux_select : in std_LOGIC_VECTOR(1 downto 0); --selected values to determine which hex operation is used
	logic_out : out std_logic_vector(3 downto 0) --resulting hex value after the operation is done
);

end logic_Processor;

architecture mux_logic of logic_Processor is

--code begins
begin 

	-- for the multiplexing of four hex input busses

	with logicMux_select (1 downto 0) select
	logic_out <= (logic_in0 AND logic_in1) when "11",
					(logic_in0 OR logic_in1) when "10",
					(logic_in0 XOR logic_in1) when "01",
					(logic_in0 XNOR logic_in1) when "00";
end mux_logic;