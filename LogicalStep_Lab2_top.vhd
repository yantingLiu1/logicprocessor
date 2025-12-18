library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity LogicalStep_Lab2_top is port (
   clkin_50			: in	std_logic;
	pb_n				: in	std_logic_vector(3 downto 0);
 	sw   				: in  std_logic_vector(7 downto 0); -- The switch inputs
   leds				: out std_logic_vector(7 downto 0); -- for displaying the switch content
   seg7_data 		: out std_logic_vector(6 downto 0); -- 7-bit outputs to a 7-segment
	seg7_char1  	: out	std_logic;				    		-- seg7 digit1 selector
	seg7_char2  	: out	std_logic				    		-- seg7 digit2 selector
	
); 
end LogicalStep_Lab2_top;

architecture SimpleCircuit of LogicalStep_Lab2_top is

	component full_adder_4bit
		port(
			a : in std_logic_vector(3 downto 0);
			b : in std_logic_vector(3 downto 0);
			carryIn : in std_logic;
			adderOut: out std_logic_vector(3 downto 0);
			carryout : out std_logic
	);
	end component; 

  component SevenSegment port (
   hex   		:  in  std_logic_vector(3 downto 0); 
   sevenseg 	:  out std_logic_vector(6 downto 0)   

   ); 
   end component;
	
	component segment7_mux port (
	clk         :  in std_logic :='0';
   DIN2   		:  in  std_logic_vector(6 downto 0);
	DIN1   		:  in  std_logic_vector(6 downto 0);   
   DOUT 			:  out std_logic_vector(6 downto 0);
	DIG2        :  out std_logic;
	DIG1			:  out std_logic


   ); 
   end component;
	
	component lastMux port(
		lastMux0 : in std_logic_vector(3 downto 0);
		lastMux1: in std_Logic_vector(3 downto 0);
		selector : in std_logic;
		result : out std_logic_vector(3 downto 0)
	);
	end component;
	
	component PB_Inverters port(
		pb_in : in std_logic_vector(3 downto 0);
		pb : out std_logic_vector(3 downto 0)
	);
	
	end component;
	
	component logic_Processor port(
		logic_in0: in std_logic_vector(3 downto 0);
		logic_in1: in std_logic_vector(7 downto 4);
		logicMux_select: in std_logic_vector(1 downto 0);
		logic_out: out std_logic_vector(3 downto 0)
	
	);
	end component;
	

--
	signal hex_A		: std_logic_vector(3 downto 0);
	signal hex_B		: std_logic_vector(3 downto 0);
	
	signal seg7_A		: std_logic_vector(6 downto 0);
	signal seg7_B		: std_logic_vector(6 downto 0);
	
	signal pb_o : std_logic_vector(3 downto 0);
	
	signal logicPIn0 : std_logic_vector(3 downto 0);
	signal logicPIn1: std_logic_vector(7 downto 4);
	signal logicPMux: std_logic_vector(1 downto 0);
	Signal logicPOut: std_logic_vector(3 downto 0);
	
	signal sumEnd : std_logic_vector(3 downto 0);
	signal adderCarry : std_logic;
	signal displayCarry : std_logic_vector(3 downto 0);
	signal signal_C : std_logic_vector(3 downto 0);
	
	signal muxOut1      : std_logic_vector(3 downto 0);
   signal muxOut2      : std_logic_vector(3 downto 0);


begin

	hex_A <= sw(3 downto 0);
	hex_B <= sw(7 downto 4); 
	signal_C <= "000" & adderCarry;
	
	MUX1: lastMux
        port map (
            lastMux0 => hex_A,
            lastMux1 => sumEnd,
            selector => pb_o(2),
            result   => muxOut1
        );
	 MUX2: lastMux
        port map (
            lastMux0 => hex_B,
            lastMux1 => signal_C,
            selector => pb_o(2),
            result   => muxOut2
        );

	INST7 : full_adder_4bit
		port map(
			a => hex_A,
			b => hex_B,
			carryIn => '0',
			adderOut => sumEnd,
			carryout => adderCarry
);


	INST1: SevenSegment port map(muxOut1, seg7_A); 
	INST2: SevenSegment port map(muxOut2, seg7_B); 
	INST3: segment7_mux port map(clkin_50, seg7_A, seg7_B, seg7_data, seg7_char1, seg7_char2);
	INST4: PB_Inverters port map(pb_n, pb_o);
	INST5: logic_Processor port map(hex_A, hex_b, pb_o(1 downto 0), leds(3 downto 0)); 
 
end SimpleCircuit;

