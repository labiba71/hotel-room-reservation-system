CREATE OR REPLACE PROCEDURE availability1(date1 in date,date2 in date,city3 in varchar2)
IS
cursor c is  SELECT room1.room_type_id1,COUNT(room1.reserve_id1)  FROM ROOM1@site_link INNER JOIN RESERVE1@site_link ON ROOM1.reserve_id1=RESERVE1.reserve_id1
where reserve1.check_in1 between date1 and date2  GROUP BY  room1.room_type_id1;
cursor c1 is  SELECT room2.room_type_id2,COUNT(room2.reserve_id2)  FROM ROOM2@site_link2 INNER JOIN RESERVE2@site_link2 ON ROOM2.reserve_id2=RESERVE2.reserve_id2
where reserve2.check_in2 between date1 and date2  GROUP BY  room2.room_type_id2;
type_id1 int;
booked_rooms int:=0;
a int:=0;


BEGIN

dbms_output.put_line( chr(9) );
if city3='dhaka'
	then
	open c;
	DBMS_OUTPUT.PUT_LINE('AVAILABLE ROOMS FROM  '||date1||'  TO  '||date2 || 'IN DHAKA :');
	dbms_output.put_line( chr(9) );
	DBMS_OUTPUT.PUT_LINE('room_type_id'||'      '||'available_rooms');
	loop
		fetch c into type_id1,booked_rooms;
		exit when c%notfound;
		a:=10-booked_rooms;
		if a!=0 then
		DBMS_OUTPUT.PUT_LINE(type_id1||'                  '||a);
		end if ;
		a:=0;
	end loop;
	close c;
elsif city3='chittagong'
		then
		open c1;
		DBMS_OUTPUT.PUT_LINE('AVAILABLE ROOMS FROM  '||date1||'  TO  '||date2 || 'IN CHITTAGONG :');
		dbms_output.put_line( chr(9) );
		DBMS_OUTPUT.PUT_LINE('room_type_id'||'      '||'available_rooms');
		loop
		fetch c1 into type_id1,booked_rooms;
		exit when c1%notfound;
		a:=10-booked_rooms;
		if a!=0 then
		DBMS_OUTPUT.PUT_LINE(type_id1||'                  '||a);
		end if ;
		a:=0;
		end loop;
		close c1;
		
	end if;

commit;
END;
/


	

