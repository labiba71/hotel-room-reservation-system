CREATE OR REPLACE PROCEDURE booking(type1 in int,type2 in int,type3 in int,date1 in date,date2 in date,city1 in varchar2)
IS
cursor c is select reserve_id1 from reserve1@site_link ; 
cursor c1 is select id1,room_no1 from room1@site_link ; 
cursor c2 is select reserve_id2 from reserve2@site_link2 ; 
cursor c3 is select id2,room_no2 from room2@site_link2 ; 

v_rid int;
v_rid1 int;
v_rid2 int;
v_id int;
v_rno int;
v_id1 int;
v_rno1 int;
v_id2 int;
v_rno2 int;
type4 int:=type1;
type5 int:=type2;
type6 int:=type3;
BEGIN


if city1='dhaka'
	then
	open c;
	loop
	fetch c into v_rid;
	exit when c%notfound;
	end loop;
		
	open c2;
	loop
	fetch c2 into v_rid1;
	exit when c2%notfound;
	end loop;
	
	if v_rid>v_rid1 then
	v_rid2:=v_rid;
	else
	v_rid2:=v_rid1;
	
	insert into reserve1@site_link values(v_rid2+1,date1,date2);
	end if;
	
	open c1;
	loop
	fetch c1 into v_id,v_rno;
	exit when c1%notfound;
	end loop;
	
	open c3;
	loop
	fetch c3 into v_id1,v_rno1;
	exit when c3%notfound;
	end loop;
	
	if v_id>v_id1 then
	v_id2:=v_id;
	v_rno2:=v_rno;
	else
	v_id2:=v_id1;
	v_rno2:=v_rno1;
	end if;
	
	for i in 1..3 loop
	if i=1 then 
    LOOP
		EXIT WHEN type4<1;
		v_id2:=v_id2+1;
		v_rno2:=v_rno2+1;
		insert into room1@site_link values(v_id2,v_rid2+1,v_rno2,i);
		type4:= type4-1;
	END LOOP;
	elsif i=2 then
	LOOP
		EXIT WHEN type5<1;
		v_id2:=v_id2+1;
		v_rno2:=v_rno2+1;
		insert into room1@site_link values(v_id2,v_rid2+1,v_rno2,i);
		type5:= type5-1;
	END LOOP;
	elsif i=3 then
	LOOP
		EXIT WHEN type6<1;
		v_id2:=v_id2+1;
		v_rno2:=v_rno2+1;
		insert into room1@site_link values(v_id2,v_rid2+1,v_rno2,i);
		type6:= type6-1;
	END LOOP;
	end if;
	end loop;
	close c;
	close c1;
	close c2;
	close c3;
	
	
elsif city1='chittagong'
then

open c;
	loop
	fetch c into v_rid;
	exit when c%notfound;
	end loop;
	
open c2;
	loop
	fetch c2 into v_rid1;
	exit when c2%notfound;
	end loop;
	
	if v_rid>v_rid1 then
	v_rid2:=v_rid;
	else
	v_id2:=v_rid1;
	end if;
	insert into reserve2@site_link2 values(v_rid2+1,date1,date2);
	
	open c1;
	loop
	fetch c1 into v_id,v_rno;
	exit when c1%notfound;
	end loop;
	
	open c3;
	loop
	fetch c3 into v_id1,v_rno1;
	exit when c3%notfound;
	end loop;
	
	if v_id>v_id1 then
	v_id2:=v_id;
	v_rno2:=v_rno;
	else
	v_id2:=v_id1;
	v_rno2:=v_rno1;
	end if;
	
	for i in 1..3 loop
	if i=1 then 
    LOOP
		EXIT WHEN type4<1;
		v_id2:=v_id2+1;
		v_rno2:=v_rno2+1;
		insert into room2@site_link2 values(v_id2,v_rid2+1,v_rno2,i);
		type4:= type4-1;
	END LOOP;
	elsif i=2 then
	LOOP
		EXIT WHEN type5<1;
		v_id2:=v_id2+1;
		v_rno2:=v_rno2+1;
		insert into room2@site_link2 values(v_id2,v_rid2+1,v_rno2,i);
		type5:= type5-1;
	END LOOP;
	elsif i=3 then
	LOOP
		EXIT WHEN type6<1;
		v_id2:=v_id2+1;
		v_rno2:=v_rno2+1;
		insert into room2@site_link2 values(v_id2,v_rid2+1,v_rno2,i);
		type6:= type6-1;
	END LOOP;
	end if;
	end loop;
	close c;
	close c1;
	close c2;
	close c3;

end if;
commit;
	
	

END;
/


