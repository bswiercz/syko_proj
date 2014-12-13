library ieee;
use ieee.std_logic_1164.all;

entity reg_a is
	generic
	(
		LW	:	integer := 8
	);
	port
	(
		clk, ie, oe, reset	:	in std_logic;
		data_in					:	in std_logic_vector(LW-1 downto 0);
		data_out					:	out std_logic_vector(LW-1 downto 0)
	);
end reg_a;


architecture behav of reg_a is
	--signal reg:	std_logic_vector(LW-1 downto 0);
	
begin
	process(reset, clk, ie, oe)
	variable reg : std_logic_vector(LW-1 downto 0);
	begin
		if falling_edge(clk) then
			if(reset = '1') then
				reg := "00000000";
			elsif(ie = '1') then
				reg := data_in;
			elsif(oe = '1') then
				data_out <= reg;
			elsif (oe = '0') then
				data_out <= (others => 'Z');


--			if(reset = '1') then
--				reg <= (others => '0');
--			elsif(ie = '1') then
--				reg <= data_in;
--			elsif(oe = '1') then
--				data_out <= reg;
--			elsif (oe = '0') then
--				data_out <= (others => 'Z');
			end if;
		end if;
	end process;

end behav;
