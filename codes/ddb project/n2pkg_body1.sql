create or replace package body myPackage2 as

	function id_exchange(guest_id11 in int)
	return int
	is
	reserve_id int;
begin
select guest2.reserve_id2 into reserve_id from guest2@site_link2 where guest2.guest_id2=(guest_id11);
return reserve_id;
end id_exchange;

	function date_duration(reserve_id12 in int)
	return int
	is
	total_amount int;
begin
 select distinct(reserve2.check_out2-reserve2.check_in2) into total_amount from reserve2@site_link2 inner join room2@site_link2 on reserve2.reserve_id2=room2.reserve_id2 where room2.reserve_id2=reserve_id12 ;
 return total_amount;
end date_duration;



	function money_count(reserve_id13 in int)
	return int
	is
	total int;
begin
select sum(room_type2.price2) into total from room_type2@site_link2 inner join room2@site_link2 on room2.room_type_id2=room_type2.type_id2 where room2.reserve_id2=reserve_id13 ;
return total;
end money_count;

end myPackage2;
/