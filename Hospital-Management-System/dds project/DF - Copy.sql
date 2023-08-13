BEGIN

        FOR R IN (SELECT * FROM DOCTOR) LOOP
		 
		   DBMS_OUTPUT.PUT_LINE(R.d_id ||' '|| R.d_name ||' '|| R.gender ||' '|| R.speciality);
	    END LOOP;

     
END;
/



