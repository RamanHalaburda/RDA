USE sample;

IF (SELECT COUNT(*)
 FROM works_on
 WHERE proj_id = 1
 GROUP BY proj_id ) > 3
 PRINT 'The number of employees in the project p1 is 4 or more'
 ELSE BEGIN
 PRINT 'The following employees work for the project p1'
 SELECT emp_fname, emp_lname
 FROM employee, works_on
 WHERE employee.emp_id = works_on.emp_id
 AND proj_id = 1
 END 


 USE sample;
 WHILE (SELECT SUM(proj_budget) FROM project) < 500000
 BEGIN
	 UPDATE project SET proj_budget = proj_budget*1.1
	 IF (SELECT MAX(proj_budget) FROM project) > 240000
		BREAK
	 ELSE 
		CONTINUE
 END 