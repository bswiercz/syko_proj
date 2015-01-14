library ieee;
use ieee.std_logic_1164.all;

entity fa is
	generic
	(
	);

	port
	(
		a:	in	std_logic;
		b:	in	std_logic;
		cin:	in	std_logic;
		s:	out	std_logic;
		cout:	out	std_logic
	);
end fa;

architecture dataflow of fa is
	signal tmp1, tmp2, tmp3:	std_logic;
begin
	tmp1<=a xor b;
	tmp2<=tmp1 and cin;
	tmp3<=a and b;
	s<=(a xor b) xor cin;
	cout<=((a xor b) and cin) or (a and b);
end dataflow;
