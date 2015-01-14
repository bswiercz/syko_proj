library ieee;
use ieee.std_logic_1164.all;

entity buffer is
	generic
	(
		delay:	time;
	);

	port
	(
		reset:		in	std_logic;
		ie:		in	std_logic;
		data_i:	in	std_logic_vector(7 downto 0);
		data_o:	out	std_logic_vector(7 downto 0)
	);
end buffer;

architecture bhv of buffer is
begin
	process(ie, data_i)
	begin
			if(ie='1')
			then
				data_o<=data_i after delay;
			elsif(ie='0')
			then
				data_o<=(others=>'Z') after delay;
			end if;
	end process;
end bhv;
