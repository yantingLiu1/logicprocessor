library ieee;
use ieee.std_logic_1164.all;

entity full_adder_4bit is
port(
	A : in std_logic_vector(3 downto 0);
	B : in std_logic_vector(3 downto 0);
	carryIn : in std_logic;

	adderOut: out std_logic_vector(3 downto 0);
	carryOut : out std_logic
);

end full_adder_4bit;


architecture adderLogic of full_adder_4bit is


--	component full_adder_1bit port(
--		x, y : in std_logic;
--		adderCarryin : in std_logic; 
--		sum : in std_logic;
--		adderCarryOut : out std_logic
--		);
--		
--		end component;
	--	Signal c1,c2,c3 : std_logic;
--		
--		begin

--		
--		A0 : full_adder_1bit port map(
--			A(0), B(0), adderCarryin, sum, adderCarryOut);
			
	
	component full_adder_1bit is
	
	port(
		A : in std_logic;
		B  : in std_logic;
		carryIn : in std_logic;
		adderOut  : out std_logic;
		carryOut : out std_logic
	);
	end component;

	Signal c1, c2, c3 : std_logic;
	
	begin

	FA0 : full_adder_1bit port map(
		A(0),
		B(0),
		carryIn,
		adderOut(0),
		c1

	);

	FA1  : full_adder_1bit port map(
		A(1),
		B(1),
		c1,
		adderOut(1),
		c2
	);

	FA2 : full_adder_1bit port map(
		A(2),
		B(2),
		c2,
		adderOut(2),
		c3
	);
	
	FA3 : full_adder_1bit port map(
		A(3),
		B(3),
		c3,
		adderOut(3),
		carryOut
	);
	
end adderLogic;