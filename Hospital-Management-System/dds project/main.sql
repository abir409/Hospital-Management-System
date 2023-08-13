SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT N NUMBER PROMPT "login as: 1 for Receptionist, 2 for Doctor, 3 for Admin :";
ACCEPT u CHAR PROMPT "Enter the username = ";
ACCEPT p CHAR PROMPT "Enter the password = ";


CREATE OR REPLACE FUNCTION isEmployee(A IN NUMBER)
RETURN NUMBER
IS

username VARCHAR2(20);
password VARCHAR2(20);   
	
BEGIN
    username := '&u';
	password := '&p';
	IF A=1 THEN
	  FOR R IN (SELECT username,password  FROM RECEPTIONIST) LOOP
		IF (username = R.username AND password = R.password) THEN
		   DBMS_OUTPUT.PUT_LINE('Welcome Receptionist');
		   return 4;
		ELSIF (username = R.username AND password != R.password) THEN
		  DBMS_OUTPUT.PUT_LINE('Wrong Password');
		  return 0;
		ELSIF (username != R.username AND password = R.password) THEN
		  DBMS_OUTPUT.PUT_LINE('Wrong username');
		  return 0;
		ELSIF (username != R.username AND password != R.password) THEN
		  DBMS_OUTPUT.PUT_LINE('Invalid username and password');
		  return 0;
		END IF;
	  END LOOP;
	ELSIF A=2 THEN
	  FOR R IN (SELECT username,password  FROM DOCTOR) LOOP
		IF (username = R.username AND password = R.password) THEN
		   DBMS_OUTPUT.PUT_LINE('Welcome Doctor');
		   return 5;
		ELSIF (username = R.username AND password != R.password) THEN
		  DBMS_OUTPUT.PUT_LINE('Wrong Password');
		  return 0;
		ELSIF (username != R.username AND password = R.password) THEN
		  DBMS_OUTPUT.PUT_LINE('Wrong username');
		  return 0;
		ELSIF (username != R.username AND password != R.password) THEN
		  DBMS_OUTPUT.PUT_LINE('Invalid username and password');
		  return 0;
		END IF;
	  END LOOP;
	ELSIF A=3 THEN
	   FOR R IN (SELECT username,password  FROM ADMINS) LOOP
		IF (username = R.username AND password = R.password) THEN
		   DBMS_OUTPUT.PUT_LINE('Welcome Admin');
		   return 6;
		ELSIF (username = R.username AND password != R.password) THEN
		  DBMS_OUTPUT.PUT_LINE('Wrong Password');
		  return 0;
		ELSIF (username != R.username AND password = R.password) THEN
		  DBMS_OUTPUT.PUT_LINE('Wrong username');
		  return 0;
		ELSIF (username != R.username AND password != R.password) THEN
		  DBMS_OUTPUT.PUT_LINE('Invalid username and password');
		  return 0;
		END IF;
	  END LOOP;
	END IF;
	return 0;
	
END isEmployee;
/

CREATE OR REPLACE TRIGGER patientAppointed
AFTER INSERT
ON APPOINTMENT
DECLARE 
BEGIN
   DBMS_OUTPUT.PUT_LINE('Patient Successfully get appoinment');
END;
/

CREATE OR REPLACE PROCEDURE receptionistActivity
IS
   
c NUMBER;
BEGIN

    c := isEmployee(1);
	IF c=4 THEN
        FOR R IN (SELECT * FROM DOCTOR WHERE speciality='Neurologists') LOOP
		   DBMS_OUTPUT.PUT_LINE(R.d_id ||'  '|| R.d_name ||'  '|| R.gender ||'  '|| R.speciality);
	    END LOOP;
		
		insert into PATIENT values(10006,'Fabiha',24,'female','01578345432');
	    insert into APPOINTMENT values(80005,'22-OCT-20 09.28.32','waiting',10006,25005);
	END IF; 
      
END receptionistActivity;
/

CREATE OR REPLACE PROCEDURE doctorActivity
IS
   
   c NUMBER;
BEGIN

    c := isEmployee(2);
	DBMS_OUTPUT.PUT_LINE(c);
	
END doctorActivity;
/


CREATE OR REPLACE PROCEDURE adminActivity
IS
   
   c NUMBER;
BEGIN

    c := isEmployee(3);
	DBMS_OUTPUT.PUT_LINE(c);
	
END adminActivity;
/


DECLARE
   lg NUMBER;
BEGIN
	lg := &N;
	
	CASE
	    WHEN lg=1 THEN
	      receptionistActivity;
	    WHEN lg=2 THEN
	      doctorActivity;
		WHEN lg=3 THEN
	      adminActivity;
		ELSE
		  DBMS_OUTPUT.PUT_LINE('Invalid Input');
	END CASE;
	  
END;
/
