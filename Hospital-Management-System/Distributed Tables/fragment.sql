SET SERVEROUTPUT ON;
SET VERIFY OFF;

Select * from DOCTOR UNION Select * from DOCTOR@site_link;
Select * from RECEPTIONIST UNION Select * from RECEPTIONIST@site_link;