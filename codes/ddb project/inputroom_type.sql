set serveroutput on
declare
	v_type_id room_type.type_id%TYPE;
	v_type_name room_type.type_name%TYPE;
	v_total room_type.total%TYPE;
	v_available room_type.available%TYPE;
	v_price room_type.price%TYPE;
	cursor cursor1 is select type_id,type_name,total,available,price from room_type;
	cursor cursor2 is select type_id,type_name,total,available,price from room_type;


begin
	open cursor1;
	loop
	fetch cursor1 into v_type_id,v_type_name,v_total,v_available,v_price;
	exit when cursor1%notfound;
	insert into room_type1@site_link values (v_type_id,v_type_name,v_total,v_available,v_price);
	end loop;
	close cursor1;

	open cursor2;
	loop
	fetch cursor2 into v_type_id,v_type_name,v_total,v_available,v_price;
	exit when cursor2%notfound;
	insert into room_type2@site_link2 values (v_type_id,v_type_name,v_total,v_available,v_price);
	end loop;
	close cursor2;

commit;
end;
/