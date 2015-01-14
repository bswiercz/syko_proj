library ieee;
use ieee.std_logic_1164.all;

entity cu is
	generic
	(
		delay:			time:=10ns;
	);

	port
	(
		clk:		in	std_logic;
		reset:		in	std_logic;
		
		alu_ctrl:	out	std_logic_vector(2 downto 0);
		A_ctrl:	out	std_logic_vector(2 downto 0);
		B_ctrl: 	out	std_logic_vector(2 downto 0);
		PC_ctrl:	out	std_logic_vector(2 downto 0)
	);
end cu;


architecture bhv of cu is
	type state_type is (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15);
	signal state, state_next: state_type;

begin
	process(clk, reset)
	begin
		if(rising_edge(clk))
		then
			if(reset_i='1')
			then
				state<=state_next;
			elsif(reset_i='0')
			then
				state<=s0;
			end if;
		end if;
	end process;

	process (clk, reset)
	begin
		case state is
			when s0=> --reset synchroniczny
				alu_ctrl_o<="ZZ";
				A_ctrl_o<="ZZ";
				b_ctrl_o<="ZZ";
				state_next<=s1;
			when s1=> --MAR<-(PC), INCR PC
				PC_ctrl<=""; --wystaw dane
				MAR_ctrl<=""; --odczyt
				PC_ctrl<="" after delay; --incr pc
				state_next<=s2;
			when s2=> --MR, MBR<-MEM
				MBR<=""; --odczyt
				MEM_ctrl<=""; --wystaw dane
			when s3=> --IR<-MBR
				MBR_ctrl<=""; --wystaw dane
				IR_ctrl<=""; --odczyt
			when s4=> --DECODE, zwolnienie szyny danych
				IR_ctrl<=""; --dekoduj instrukcje
			when s5=> --
		end case;
		
		state<=state_next;
	end process;
end bhv;
