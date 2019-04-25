set serveroutput on;
declare
	v_id room.id%type;
	v_reserve_id room.reserve_id%type;
	v_room_no room.room_no%type;
	v_room_type_id room.room_type_id%type;
	cursor cursor1 is select room.id,room.reserve_id,room.room_no,room.room_type_id from room inner join reserve on room.reserve_id=reserve.reserve_id inner join guest on reserve.reserve_id=guest.reserve_id where guest.city='dhaka';
	cursor cursor2 is select room.id,room.reserve_id,room.room_no,room.room_type_id from room inner join reserve on room.reserve_id=reserve.reserve_id inner join guest on reserve.reserve_id=guest.reserve_id where guest.city='chittagong';


begin
	open cursor1;
	loop
	fetch cursor1 into v_id,v_reserve_id,v_room_no,v_room_type_id;
	exit when cursor1%notfound;
	insert into room1@site_link values (v_id,v_reserve_id,v_room_no,v_room_type_id);
	end loop;
	close cursor1;

	open cursor2;
	loop
	fetch cursor2 into v_id,v_reserve_id,v_room_no,v_room_type_id;
	exit when cursor2%notfound;
	insert into room2@site_link2 values (v_id,v_reserve_id,v_room_no,v_room_type_id);
	end loop;
	close cursor2;

commit;
end;
/