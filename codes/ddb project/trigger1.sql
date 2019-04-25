SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER display_guest_details1 
BEFORE UPDATE ON guest1@site_link 
FOR EACH ROW 
WHEN (NEW.payment1 > 0) 
DECLARE
	v_chq_in date;
	v_chq_out date;
	v_reserve_id int;
	v_room_no int;
	v_room_type_id int;
	
	cursor cursor1 is select room1.room_no1,room1.room_type_id1 from room1@site_link where room1.reserve_id1=v_reserve_id;
	 
    
BEGIN
	v_reserve_id:= :NEW.reserve_id-0;
	select reserve1.check_in1,reserve1.check_out1 into v_chq_in,v_chq_out from reserve1@site_link where reserve1.reserve_id1=v_reserve_id;
	
   dbms_output.put_line('Guest Name: ' || :NEW.name); 
   dbms_output.put_line('Guest Phone No: ' || :NEW.phone);
   dbms_output.put_line('Guest City: ' || :NEW.city);   
   dbms_output.put_line('total bill: ' || :NEW.payment);
   dbms_output.put_line('Check in date: ' || v_chq_in);
   dbms_output.put_line('Check in date: ' || v_chq_out);
   open cursor1;
	loop
	fetch cursor1 into v_room_no,v_room_type_id ;
	exit when cursor1%notfound;
	dbms_output.put_line('room_no: ' || v_room_no);
	dbms_output.put_line('room_type_id: ' || v_room_type_id);
	end loop;
 
   close cursor1;  
END; 
/ 