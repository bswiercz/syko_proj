library ieee;
use ieee.std_logic_1164.all;

entity pc is
	generic
	(
		delay:	time:=500 ps;
	);

	port
	(
		reset:	in	std_logic;
		pcnt:	inout	std_logic_vector(7 downto 0);
		ctrl:	in	std_logic_vector(1 downto 0)
	);
end pc;

architecture bhv of pc is
	signal tmp_val:	std_logic_vector(7 downto 0);
begin
	process(clk, reset, ctrl)
	begin
		if(rising_edge(clk))
		then
			if(reset='1')
			then
				tmp_val<="00000000";
			elsif(ctrl="00")
			then
				data<=tmp_val;
			elsif(ctrl="01")
			then
				tmp_val<=data
			elsif(ctrl="10")
			then
				ag<=data
			else
				data<="ZZZZZZZZ";
				ag<="ZZZZZZZZ";
			end if;
		end if;
	end process;
end bhv;
