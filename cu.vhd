library ieee;
use ieee.std_logic_1164.all;

entity cu is
	generic
	(
	);

	port
	(
		clk:	in	std_logic;
		reset:	in	std_logic;
		data1:	in	std_logic_vector(7 downto 0);
		data2:	in	std_logic_vector(7 downto 0);
		ctrl:	in	std_logic;
		flags:	out	std_logic_vector(3 downto 0);
		data3: out	std_logic_vector(7 downto 0)
	);
end alu;


architecture bhv of cu is
	signal reg: std_logic_vector(7 downto 0);

	type state_type is (s0, s1, s2, s3);
	signal state: state_type;

begin
	process (clk, reset)
	begin
		if reset = '1' then
			state <= s0;
		elsif (rising_edge(clk)) then
			case state is
				when s0=>
					if input = '1' then
						state <= s1;
					else
						state <= s0;
					end if;
				when s1=>
					if input = '1' then
						state <= s2;
					else
						state <= s1;
					end if;
				when s2=>
					if input = '1' then
						state <= s3;
					else
						state <= s2;
					end if;
				when s3=>
					if input = '1' then
						state <= s3;
					else
						state <= s1;
					end if;
			end case;
		end if;
	end process;
end bhv;
