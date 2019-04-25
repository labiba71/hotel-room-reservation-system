set serveroutput on
declare
	v_reserve_id reserve.reserve_id%TYPE;
	v_check_in reserve.check_in%TYPE;
	v_check_out reserve.check_out%TYPE;
	cursor cursor1 is select reserve.reserve_id,reserve.check_in,reserve.check_out from reserve inner join guest on guest.reserve_id=reserve.reserve_id where guest.city='dhaka';
	cursor cursor2 is select reserve.reserve_id,reserve.check_in,reserve.check_out from reserve inner join guest on guest.reserve_id=reserve.reserve_id where guest.city='chittagong';


begin
	open cursor1;
	loop
	fetch cursor1 into v_reserve_id,v_check_in,v_check_out;
	exit when cursor1%notfound;
	insert into reserve1@site_link values (v_reserve_id,v_check_in,v_check_out);
	end loop;
	close cursor1;

	open cursor2;
	loop
	fetch cursor2 into v_reserve_id,v_check_in,v_check_out;
	exit when cursor2%notfound;
	insert into reserve2@site_link2 values (v_reserve_id,v_check_in,v_check_out);
	end loop;
	close cursor2;

commit;	
end;
/