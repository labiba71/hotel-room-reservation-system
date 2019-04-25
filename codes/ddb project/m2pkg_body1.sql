create or replace package body myPackage as

	function id_exchange(guest_id11 in int)
	return int
	is
	reserve_id int;
begin
select guest1.reserve_id1 into reserve_id from guest1@site_link where guest1.guest_id1=(guest_id11);
return reserve_id;
end id_exchange;

	function date_duration(reserve_id12 in int)
	return int
	is
	total_amount int;
begin
 select distinct(reserve1.check_out1-reserve1.check_in1) into total_amount from reserve1@site_link inner join room1@site_link on reserve1.reserve_id1=room1.reserve_id1 where room1.reserve_id1=reserve_id12 ;
 return total_amount;
end date_duration;



	function money_count(reserve_id13 in int)
	return int
	is
	total int;
begin
select sum(room_type1.price1) into total from room_type1@site_link inner join room1@site_link on room1.room_type_id1=room_type1.type_id1 where room1.reserve_id1=reserve_id13 ;
return total;
end money_count;

end myPackage;
/