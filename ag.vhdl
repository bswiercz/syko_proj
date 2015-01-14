library ieee;
use ieee.std_logic_1164.all;

entity ag is
	generic
	(
		delay:	time;
	);

	port
	(
		addr_reg1_i:	in	std_logic_vector(7 downto 0);
		addr_reg2_i:	in	std_logic_vector(7 downto 0);
		addr_imr_i:	in	std_logic_vector(7 downto 0);
		addr_pc_i:	in	std_logic_vector(7 downto 0);
		ctrl_i:	in	std_logic_vector(1 downto 0);
		addr_o:	out	std_logic_vector(7 downto 0)
	);
end ag;

architecture bhv of ag is
begin
	with ctrl select
		addr_o<=	addr_reg1_i after delay when "00",
				addr_reg2_i after delay when "01",
				addr_imr_i after delay when "10",
				addr_pc_i after delay when "11",
				"ZZZZZZZZ" after delay when others;
end bhv;
