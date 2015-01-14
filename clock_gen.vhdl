library ieee;
use ieee.std_logic_1164.all;

entity clock_gen is
	generic
	(
		okres:	time;
	);

	port
	(
		clk:	inout	std_logic
	);
end clock_gen;

architecture bhv of clock_gen is
begin
	process(clk)
	begin
		clk<=not clk after (0.5*okres);
	end process;
end bhv;
