SET SERVEROUTPUT ON;
SET VERIFY OFF;

create or replace view doctorsAppointment as (select * from APPOINTMENT where d_id=25005);
select p.p_name,p.age,p.gender,a.visitingDate,a.status,a.ap_id from PATIENT p join doctorsAppointment a on p.p_id=a.p_id;


create or replace view doctorView as (select * from DOCTOR);
select dv.d_id,dv.d_name,dv.gender,dv.speciality from doctorView dv;



 --create or replace view doctorView as (select * from DOCTOR);
 --select dv.d_id,dv.d_name,dv.gender,dv.speciality from doctorView dv;
	   
	   --insert into PATIENT values(10004,'Sumi AKter',39,'female','01398789090');
	   --insert into APPOINTMENT values(50004,'22-OCT-20 09.28.32','waiting',10004,1001);





