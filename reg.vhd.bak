library ieee;
use ieee.std_logic_1164.all;

entity alu is
	generic
	(
	);

	port
	(
		reset:	in	std_logic;
		data1:	in	std_logic_vector(7 downto 0);
		data2:	in	std_logic_vector(7 downto 0);
		ctrl:	in	std_logic;
		flags:	out	std_logic_vector(3 downto 0);
		data3: out	std_logic_vector(7 downto 0)
	);
end alu;


architecture bhv of alu is
	signal reg:	std_logic_vector(7 downto 0);
begin
	process(reset, ctrl)
	begin
		if(reset='1')
		then
			reg<="00000000";
		elsif(ctrl="00000001")
		then
			ag<=reg;
		elsif(ctrl="00000010")
		then
			reg<=data
		else
			data<="ZZZZZZZZ";
			ag<="ZZZZZZZZ";
		end if;
	end process;

	data3<=reg;
end bhv;
