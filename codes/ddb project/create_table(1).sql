clear screen;

DROP TABLE GUEST CASCADE CONSTRAINTS;
DROP TABLE RESERVE CASCADE CONSTRAINTS;
DROP TABLE ROOM CASCADE CONSTRAINTS;
DROP TABLE ROOM_TYPE CASCADE CONSTRAINTS;


CREATE TABLE RESERVE(
	reserve_id int,
	check_in date,
	check_out date,
	PRIMARY KEY(reserve_id)
	);

CREATE TABLE GUEST(
	guest_id int,
	reserve_id int,
	name varchar2(15),
	address varchar2(25),
	email varchar2(30),
	phone varchar2(11),
	city varchar2(11),
	payment int,
	PRIMARY KEY(guest_id),
	FOREIGN KEY(reserve_id) REFERENCES RESERVE(reserve_id)
	);

CREATE TABLE ROOM_TYPE(
	type_id int,
	type_name varchar2(30),
	total int,
	available int,
	price int,
	PRIMARY KEY(type_id)
	);

CREATE TABLE ROOM(
	id int,
	reserve_id int,
	room_no int,
	room_type_id int,
	PRIMARY KEY(id),
	FOREIGN KEY(reserve_id) REFERENCES RESERVE(reserve_id),
	FOREIGN KEY(room_type_id) REFERENCES ROOM_TYPE(type_id)
	);

	commit;