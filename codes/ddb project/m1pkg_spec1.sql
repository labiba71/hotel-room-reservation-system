create or replace package myPackage as

	function id_exchange(guest_id11 in int)
	return int; 
	
	function date_duration(reserve_id12 in int)
	return int;

	function money_count(reserve_id13 in int)
	return int;

end myPackage;
/