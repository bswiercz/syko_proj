library ieee;
use ieee.std_logic_1164.all;

entity rejestr is
	generic
	(
	);

	port
	(
		reset:	in	std_logic;
		data:	inout	std_logic_vector(7 downto 0);
		ag:	out	std_logic_vector(7 downto 0);
		ctrl:	in	std_logic_vector(7 downto 0)
	);
end rejestr;


architecture bhv of rejestr is
	signal value:	std_logic_vector(7 downto 0);
begin
	process(reset, ctrl)
	begin
		if(reset='1')
		then
			value<="00000000";
		elsif(ctrl="")
		then
			--
		else
			data<="ZZZZZZZZ";
			ag<="ZZZZZZZZ";
		end if;
	end process;
end bhv;
