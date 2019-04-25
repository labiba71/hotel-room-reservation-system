CREATE OR REPLACE PROCEDURE info1(name3 in varchar2,address3 in varchar2,email3 in varchar2,phone3 in varchar2,city3 in varchar2)
IS
cursor c is select reserve_id1 from reserve1@site_link ; 
cursor c1 is select guest_id1 from guest1@site_link ;
cursor c2 is select reserve_id2 from reserve2@site_link2 ; 
cursor c3 is select guest_id2 from guest2@site_link2 ; 
v_rid int;
v_gid int;
BEGIN
if city3='dhaka'
	then
	open c;
	loop
	fetch c into v_rid;
	exit when c%notfound;
	end loop;
	open c1;
	loop
	fetch c1 into v_gid;
	exit when c1%notfound;
	end loop;
	
	insert into guest1@site_link(guest_id1,reserve_id1,name1,address1,email1,phone1,city1) values(v_gid+1,v_rid,name3,address3,email3,phone3,city3);
	close c;
	close c1;
	
	elsif city3='chittagong'
	then
	open c2;
	loop
	fetch c2 into v_rid;
	exit when c2%notfound;
	end loop;
	open c3;
	loop
	fetch c3 into v_gid;
	exit when c3%notfound;
	end loop;
	
	insert into guest2@site_link2(guest_id2,reserve_id2,name2,address2,email2,phone2,city2) values(v_gid+1,v_rid,name3,address3,email3,phone3,city3);
	close c;
	close c1;
	
end if ;
commit;
END;
/