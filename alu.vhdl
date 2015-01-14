library ieee;
use ieee.std_logic_1164.all;

entity alu is
	port
	(
		reset:	in	std_logic;
		data1:	in	std_logic_vector(7 downto 0);
		data2:	in	std_logic_vector(7 downto 0);
		op:	in	std_logic;
		flags:	out	std_logic_vector(3 downto 0);
		data_o: out	std_logic_vector(7 downto 0)
	);
end alu;


architecture bhv of alu is
	signal sub_in:	std_logic_vector(7 downto 0);
	signal sub_carry:	std_logic_vector(8 downto 0);
	signal sub_out:	std_logic_vector(7 downto 0);
	signal flags_reg:	std_logic_vector(3 downto 0);
begin
	-----------------------------
	-- SUB
	-----------------------------
	sub_in(0)<=data2(0) xor '1';
	sub_in(1)<=data2(1) xor '1';
	sub_in(2)<=data2(2) xor '1';
	sub_in(3)<=data2(3) xor '1';
	sub_in(4)<=data2(4) xor '1';
	sub_in(5)<=data2(5) xor '1';
	sub_in(6)<=data2(6) xor '1';
	sub_in(7)<=data2(7) xor '1';
	sub_carry(0)<='1';
	sub_out(0)<=(data1(0) xor sub_in(0)) xor sub_carry(0);
	sub_carry(1)<=((data1(0) xor sub_in(0)) and sub_carry(0)) or (data1(0) and sub_in(0));
	sub_out(1)<=(data1(1) xor sub_in(1)) xor sub_carry(1);
	sub_carry(2)<=((data1(1) xor sub_in(1)) and sub_carry(1)) or (data1(1) and sub_in(1));
	sub_out(2)<=(data1(2) xor sub_in(2)) xor sub_carry(2);
	sub_carry(3)<=((data1(2) xor sub_in(2)) and sub_carry(2)) or (data1(2) and sub_in(2));
	sub_out(3)<=(data1(3) xor sub_in(3)) xor sub_carry(3);
	sub_carry(4)<=((data1(3) xor sub_in(3)) and sub_carry(3)) or (data1(3) and sub_in(3));
	sub_out(4)<=(data1(4) xor sub_in(4)) xor sub_carry(4);
	sub_carry(5)<=((data1(4) xor sub_in(4)) and sub_carry(4)) or (data1(4) and sub_in(4));
	sub_out(5)<=(data1(5) xor sub_in(5)) xor sub_carry(5);
	sub_carry(6)<=((data1(5) xor sub_in(5)) and sub_carry(5)) or (data1(5) and sub_in(5));
	sub_out(6)<=(data1(6) xor sub_in(6)) xor sub_carry(6);
	sub_carry(7)<=((data1(6) xor sub_in(6)) and sub_carry(6)) or (data1(6) and sub_in(6));
	sub_out(7)<=(data1(7) xor sub_in(7)) xor sub_carry(7);
	sub_carry(8)<=((data1(7) xor sub_in(7)) and sub_carry(7)) or (data1(7) and sub_in(7));
	with sub_out select
		flags_reg(0)<='1' when "00000000", '0' when others; --zero flag
	flags_reg(1)<=sub_carry(8); --carry flag
	flags_reg(2)<=data1(7) xor sub_in(7); --overflow flag
	flags_reg(3)<=sub_out(7); --sign flag

	-----------------------------
	-- ALU CTRL
	-----------------------------
	process(data1, data2, op)
	begin
		case op is
			when '0'=>data_o<=sub_out;
			when '1'=>data_o<=data1 and data2;
			when others=>data_o<="ZZZZZZZZ";
		end case;
	end process;
end bhv;
