library ieee;
use ieee.std_logic_1164.all;

entity acc is
	generic
	(
		delay:	time;
	);

	port
	(
		reset:		in	std_logic;
		ie:		in	std_logic;
		oe:		in	std_logic;
		data_i:	in	std_logic_vector(7 downto 0);
		data_o:	out	std_logic_vector(7 downto 0)
	);
end acc;

architecture bhv of acc is
	signal tmp_val:	std_logic_vector(7 downto 0);
begin
	process(reset, ie, oe)
	begin
		if(rising_edge(clk))
		then
			if(reset='1')
			then
				tmp_val<="00000000";
			elsif(oe='1')
			then
				data_o<=tmp_val after delay;
			elsif(oe='0')
			then
				data_o<=(others=>'Z') after delay;
			elsif(ie='1')
			then
				tmp_val<=data_i;
			end if;
		end if;
	end process;
end bhv;
