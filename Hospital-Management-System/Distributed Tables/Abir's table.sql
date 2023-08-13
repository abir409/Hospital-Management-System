clear screen;
SET SERVEROUTPUT ON;
SET VERIFY OFF;

DROP TABLE RECEPTIONIST CASCADE CONSTRAINTS;
DROP TABLE DOCTOR CASCADE CONSTRAINTS;
DROP TABLE Admins CASCADE CONSTRAINTS;
--DROP TABLE PATIENT CASCADE CONSTRAINTS;
DROP TABLE APPOINTMENT CASCADE CONSTRAINTS;

CREATE TABLE RECEPTIONIST (
	r_id int, 
	username varchar2(20), 
	password varchar2(20), 
	r_name varchar2(20), 
	gender varchar2(10), 
	address varchar2(30),
	mobile varchar2(11),
    PRIMARY KEY(r_id)
); 

insert into RECEPTIONIST values(12001,'Rakibul','Rakibul123','Rakibul Islam','Male','Mirpur','01783822286');
insert into RECEPTIONIST values(12002,'Shahadat','Shahadat123','Shahadat Rahman','Male','Mirpur','01712338123');
insert into RECEPTIONIST values(12003,'Shammi','Shammi123','Shammi Akter','Female','Mirpur','01783786123');

CREATE TABLE DOCTOR(
	d_id int, 
	username varchar2(20), 
	password varchar2(20), 
	d_name varchar2(20), 
	gender varchar2(10), 
	address varchar2(30),
	mobile varchar2(11),
	speciality varchar2(20),
    PRIMARY KEY(d_id)
); 

insert into DOCTOR values(25001,'Shamim','Shamim123','Dr Shamim Ahmed','male','Mirpur','01716000765','Cardiologists');
insert into DOCTOR values(25002,'Rahim','Rahim123','Dr Rahim Hasan','male','Mirpur','01713334576','Immunologists');
insert into DOCTOR values(25003,'Faysal','Faysal34','Dr Faysal Sen','female','Mirpur','01835765586','Urologists');

CREATE TABLE Admins(
	a_id int, 
	username varchar2(20), 
	password varchar2(20), 
	a_name varchar2(20), 
	address varchar2(30),
	mobile varchar2(11),
    PRIMARY KEY(a_id)
); 

insert into Admins values(60001,'Abir','Abir123','Rabby Togar','Mirpur','01716665461');
insert into Admins values(60002,'Togar','Togar123','Abir Alam','Niketon','01634456734');

CREATE TABLE APPOINTMENT(
	ap_id int, 
	visitingDate TIMESTAMP,
	status varchar2(10),
	p_id int, 
	d_id int,
    PRIMARY KEY(ap_id),
	FOREIGN KEY(p_id) REFERENCES PATIENT(p_id),
	FOREIGN KEY(d_id) REFERENCES DOCTOR(d_id)
); 

insert into APPOINTMENT values(80001,'26-Jan-23 07.28.32','waiting',70001,25003);
insert into APPOINTMENT values(80002,'26-Jan-23 08.00.32','waiting',70002,25001);
insert into APPOINTMENT values(80003,'26-Jan-22 08.15.32','waiting',70003,25002);

commit;

