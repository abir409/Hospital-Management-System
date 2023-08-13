clear screen;
SET SERVEROUTPUT ON;
SET VERIFY OFF;

DROP TABLE RECEPTIONIST2 CASCADE CONSTRAINTS;
DROP TABLE DOCTOR2 CASCADE CONSTRAINTS;
--DROP TABLE Admins CASCADE CONSTRAINTS;
DROP TABLE PATIENT CASCADE CONSTRAINTS;
--DROP TABLE APPOINTMENT CASCADE CONSTRAINTS;

CREATE TABLE RECEPTIONIST2 (
	r_id int, 
	username varchar2(20), 
	password varchar2(20), 
	r_name varchar2(20), 
	gender varchar2(10), 
	address varchar2(30),
	mobile varchar2(11),
    PRIMARY KEY(r_id)
);

insert into RECEPTIONIST2 values(12004,'Afroza','Afroza123','Afroza Akter','Female','Dhanmondi','01783809834');
insert into RECEPTIONIST2 values(12005,'Modina','Modina123','Modina Raisa','Female','Dhanmondi','01734532134');
insert into RECEPTIONIST2 values(12006,'Rusha','Rusha123','Rusha Akter','Female','Dhanmondi','01734532134');

CREATE TABLE DOCTOR2(
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

insert into DOCTOR2 values(25004,'Rithi','Rithi8765','Dr Rithi Akter','female','Dhanmondi','01550987362','Gastroenterologists');
insert into DOCTOR2 values(25005,'Nitu','Nitu765','Dr Nitu Jaman','female','Dhanmondi','01714765674','Neurologists');
insert into DOCTOR2 values(25006,'Priya','ppopo13','Dr Priya Gutta','female','Dhanmondi','01567543212','Gastroenterologists');
insert into DOCTOR2 values(25007,'Hanif','Hanif765','Dr Hanif Hasan','male','Dhanmondi','01823450989','Urologists');

CREATE TABLE PATIENT(
	p_id int, 
	p_name varchar2(50), 
    age int,
	gender varchar2(20),
	mobile varchar2(50),
    PRIMARY KEY(p_id)
); 

insert into PATIENT values(70001,'Rupom Hasan',12,'male','01716632121');
insert into PATIENT values(70002,'Shamima Akter',55,'female','01513212987');
insert into PATIENT values(70003,'Shefali Gandhi',30,'female','01876753432');

commit;