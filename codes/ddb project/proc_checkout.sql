CREATE OR REPLACE PROCEDURE proc_checkout
IS
cursor c is 
select room.room_type_id from room inner join
   reserve on room.reserve_id=reserve.reserve_id
   where reserve.check_out < sysdate;


v_typeid int;


BEGIN

open c;
loop
	fetch c into v_typeid;
	exit when c%notfound;
	update room_type set available=available+1 where type_id=v_typeid;
	
end loop;
close c;
commit;
END;
/