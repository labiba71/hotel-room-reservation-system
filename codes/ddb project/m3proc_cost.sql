CREATE OR REPLACE PROCEDURE cost(city1 in varchar2)
IS

	cursor cursor1 is select guest_id1 from guest1@site_link where guest1.city1='dhaka';
	cursor cursor2 is select guest_id2 from guest2@site_link2 where guest2.city2='chittagong';
	
id1 int;
price1 int:=0;
price2 int:=0;
price3 int:=0;
id_exchange1 int;

BEGIN
dbms_output.put_line( chr(9) );
if city1='dhaka'
	then
	open cursor1;
	dbms_output.put_line( chr(9) );
	loop
		fetch cursor1 into id1;
		exit when cursor1%notfound;
	end loop;
	DBMS_OUTPUT.PUT_LINE(id1);

	id_exchange1:=myPackage.id_exchange(id1);
	price1:=myPackage.date_duration(id_exchange1);
	price2:=myPackage.money_count(id_exchange1);
	price3:=price1*price2;
	dbms_output.put_line('guest id '||' Total night stay '||' total cost ');
	dbms_output.put_line( id1||'          '||price1||'                 '||price3);

	update guest1@site_link set guest1.payment1=price3 where guest1.guest_id1=id1;
	close cursor1;




elsif city1='chittagong'
	then
	open cursor2;
	dbms_output.put_line( chr(9) );
	loop
		fetch cursor2 into id1;
		exit when cursor2%notfound;
	end loop;
	DBMS_OUTPUT.PUT_LINE(id1);

	id_exchange1:=myPackage2.id_exchange(id1);
	price1:=myPackage2.date_duration(id_exchange1);
	price2:=myPackage2.money_count(id_exchange1);
	price3:=price1*price2;
	dbms_output.put_line('guest id '||' Total night stay '||' total cost ');
	dbms_output.put_line( id1||'          '||price1||'                 '||price3);

	update guest2@site_link2 set guest2.payment2=price3 where guest2.guest_id2=id1;
	close cursor2;
		
	end if;

	
commit;	
end;
/