set serveroutput on
DECLARE
date1 date:='19-july-2018';
date2 date:='07-august-2018';
city1 varchar2(11):='chittagong';
type1 int:=1;
type2 int:=2;
type3 int:=1;


BEGIN
	
	--availability1(date1,date2,city1);
	/*dbms_output.put_line( chr(9) );
	dbms_output.put_line('Single bed : '||type1 );
	dbms_output.put_line('Double bed : '||type2 );
	dbms_output.put_line('Cottage : '||type3 );
	booking(type1,type2,type3,date1,date2,city1);*/
	/*dbms_output.put_line( chr(9) );
	dbms_output.put_line( 'Insert personal information : ' );
	dbms_output.put_line( 'Name : '||'khan' );
	dbms_output.put_line( 'Address : '||'uttara' );
	dbms_output.put_line( 'Email : '|| 'k@gmail.com');
	dbms_output.put_line( 'Phone : '|| '01712334467');
	info1('khan','uttara','k@gmail.com','01712334467',city1);*/
	--cost(city1);
	proc_checkout;
	--proc_cancel(4,city1);
	
	
END;
/