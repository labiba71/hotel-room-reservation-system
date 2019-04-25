CREATE OR REPLACE PROCEDURE proc_cancel(reserve_id3 in int,city3 in int)
IS

cursor c1 is  SELECT room1.room_type_id1,COUNT(room1.reserve_id1)  FROM ROOM1@site_link INNER JOIN RESERVE1@site_link ON ROOM1.reserve_id1=RESERVE1.reserve_id1
where room1.reserve_id1=reserve_id3  GROUP BY  room1.room_type_id1;
cursor c2 is  SELECT room2.room_type_id2,COUNT(room2.reserve_id2)  FROM ROOM2@site_link2 INNER JOIN RESERVE2@site_link2 ON ROOM2.reserve_id2=RESERVE2.reserve_id2
where room2.reserve_id2=reserve_id3  GROUP BY  room2.room_type_id2;

v_tid int;
c_rid int;


BEGIN
if city3='dhaka'
then
open c1;
loop
	fetch c1 into v_tid,c_rid;
	exit when c1%notfound;
	update room_type1@site_link set available1=available1+c_rid where type_id1=v_tid;
	
end loop;	
close c1;

elsif city3='chittagong'
then
open c2;
loop
	fetch c2 into v_tid,c_rid;
	exit when c2%notfound;
	update room_type2@site_link2 set available2=available2+c_rid where type_id2=v_tid;
	
end loop;	
close c2;
end if ;
commit;
END;
/