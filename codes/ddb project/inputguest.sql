set serveroutput on
declare
	v_reserve_id guest.reserve_id%TYPE;
	v_id guest.guest_id%TYPE;
	v_name guest.name%TYPE;
	v_address guest.address%TYPE;
	v_email guest.email%TYPE;
	v_phone guest.phone%TYPE;
	v_city guest.city%TYPE;
	v_payment guest.payment%TYPE;
	cursor cursor1 is select reserve_id,guest_id,name,address,email,phone,city,payment from guest where city='dhaka';
	cursor cursor2 is select reserve_id,guest_id,name,address,email,phone,city,payment from guest where city='chittagong';
	
begin
	open cursor1;
	loop
	fetch cursor1 into v_reserve_id, v_id,v_name,v_address,v_email,v_phone,v_city,v_payment;
	exit when cursor1%notfound;
	insert into guest1@site_link values (v_reserve_id, v_id,v_name,v_address,v_email,v_phone,v_city,v_payment);
	end loop;
	close cursor1;



	open cursor2;
	loop
	fetch cursor2 into v_reserve_id, v_id,v_name,v_address,v_email,v_phone,v_city,v_payment;
	exit when cursor2%notfound;
	insert into guest2@site_link2 values (v_reserve_id, v_id,v_name,v_address,v_email,v_phone,v_city,v_payment);
	end loop;
	close cursor2;
	
commit;	
end;
/