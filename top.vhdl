library ieee;
use ieee.std_logic_1164.all;

entity projekt is
	generic
	(
		delay:			time:=10ns;
	);

	port
	(
		clk, reset:	in	std_logic;
	);
end projekt;

architecture bhv of projekt is
	signal data_bus: std_logic_vector(7 downto 0);
	signal addr_bus: std_logic_vector(15 downto 0);
begin
	--
end bhv;
