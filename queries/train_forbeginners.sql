 USE sample;
 SELECT emp_id, emp_lname
 FROM employee
 WHERE emp_id = (
 SELECT MIN(emp_id)
 FROM employee);

  SELECT SUM(proj_budget) sum_of_budgets
 FROM project
 GROUP BY(); 

 USE sample;
 SELECT proj_id, COUNT(DISTINCT job) job_count
 FROM works_on
 GROUP BY proj_id;

  USE sample;
 SELECT job, COUNT(*) job_count
 FROM works_on
 GROUP BY job; 

 /*
 USE AdventureWorks2012;
SELECT BusinessEntityID, JobTitle, BirthDate
FROM HumanResources.Employee
WHERE Gender = 'F'
ORDER BY JobTitle
OFFSET 20 ROWS
FETCH NEXT 10 ROWS ONLY; 
*/

/*
USE sample;
 CREATE TABLE product
 (product_no INTEGER IDENTITY(10000, 1) NOT NULL,
 product_name CHAR(30) NOT NULL,
 price MONEY
 );

 SELECT $identity
 FROM product
 WHERE product_name = 'Soap'; 

 SELECT IDENT_SEED('product'), IDENT_INCR('product)'
 */

 /*
 USE sample;
 CREATE SEQUENCE dbo.Sequence1
 AS INT
 START WITH 1 INCREMENT BY 5
 MINVALUE 1 MAXVALUE 256
 CYCLE;  */ USE sample;
 SELECT proj_title,
 CASE
 WHEN proj_budget > 0 AND proj_budget < 100000 THEN 1
 WHEN proj_budget >= 100000 AND proj_budget < 200000 THEN 2
 WHEN proj_budget >= 200000 AND proj_budget < 300000 THEN 3
 ELSE 4
 END budget_weight
 FROM project; 
USE sample;
 SELECT proj_title,
 CASE
 WHEN p1.proj_budget < (SELECT AVG(p2.proj_budget) FROM project p2)
 THEN 'below average'
 WHEN p1.proj_budget = (SELECT AVG(p2.proj_budget) FROM project p2)
 THEN 'on average' 
 WHEN p1.proj_budget > (SELECT AVG(p2.proj_budget) FROM project p2)
 THEN 'above average'
 END budget_category
 FROM project p1; 
 select employee.emp_lname, department.dept_name
	from employee RIGHT JOIN department
	ON employee.dept_id = department.dept_id;

/*
 USE sample;
 SELECT emp_fname, emp_lname
 FROM works_on JOIN employee ON works_on.emp_no=employee.emp_no
 JOIN department ON employee.dept_no=department.dept_no
 AND location = 'Seattle'
 AND job = 'analyst';
*/

/*
Пример 6.61. Выборка наименований проектов (с удалением избыточных
дубликатов), в которых участвуют сотрудники бухгалтерии (отдел Accounting)
 USE sample;
 SELECT DISTINCT project_name
 FROM project JOIN works_on
 ON project.project_no = works_on.project_no
 JOIN employee ON works_on.emp_no = employee.emp_no
 JOIN department ON employee.dept_no = department.dept_no
 WHERE dept_name = 'Accounting'; 
*/

 select employee.emp_lname, department.dept_name
	from employee cross JOIN department;

/*
Тета-соединение

Пример 6.67. Операция тета-соединения с условием "меньше чем"
*/
 USE sample;
 SELECT emp_fname, emp_lname, domicile, location
 FROM employee_enh JOIN department
 ON domicile < location; 

/*
Самосоединение,
или соединение таблицы самой с собой 

Пример 6.68. Выборка всех отделов (с полной информацией),
расположенных в том же самом месте, как и, по крайней мере, один другой отдел*/
 USE sample;
 SELECT t1.dept_id, t1.dept_name, t1.location
 FROM department t1 JOIN department t2
 ON t1.location = t2.location
 WHERE t1.dept_id <> t2.dept_id; 

 /*
 Полусоединение 

 Пример 6.69. Использование полусоединения
 */
 USE sample;
 SELECT emp_no, emp_lname, e.dept_no
 FROM employee e JOIN department d
 ON e.dept_no = d.dept_no WHERE location = 'Dallas';

 --*************************

 -- связанный подзапрос (с IN)
  USE sample;
 SELECT emp_lname
 FROM employee
 WHERE '1' IN
 (SELECT proj_id
 FROM works_on
 WHERE works_on.emp_id = employee.emp_id); 

/*
   USE sample;
 SELECT emp_lname
 FROM employee JOIN works_on ON employee.dept_id = work_on.emp_id
			   JOIN project ON project.proj_id = work_on.proj_id;*/

-- with EXISTS
  USE sample;
 SELECT emp_lname
 FROM employee
 WHERE EXISTS (SELECT *
 FROM works_on
 WHERE employee.emp_id = works_on.emp_id
 AND proj_id = '1'); 

-- Пример 6.72. Выборка фамилий сотрудников, чей отдел не расположен в Сиэтле
USE sample;
SELECT emp_lname 
FROM employee
WHERE NOT EXISTS (SELECT *
FROM department
WHERE employee.dept_no = department.dept_no
AND location = 'Seattle');

-- производные таблицы
 USE sample;
 SELECTenter_month
 FROM (SELECT MONTH(enter_date) as enter_month
 FROM works_on) AS m
 GROUP BY enter_month; 

 -- нерекурсивный запрос
 USE sample;
 SELECTenter_month
 FROM (SELECT MONTH(enter_date) as enter_month
 FROM works_on) AS m
 GROUP BY enter_month; 

 -- Пример 6.79. Использование ОТВ для сокращения объема запроса
 USE AdventureWorks;
 WITH price_calc(year_2002) AS
 (SELECT AVG(TotalDue)
 FROM Sales.SalesOrderHeader
 WHERE YEAR(OrderDate) = '2002')
 SELECT SalesOrderID
 FROM Sales.SalesOrderHeader
 WHERE TotalDue > (SELECT year_2002 FROM price_calc)
 AND Freight > (SELECT year_2002 FROM price_calc)/2.5; 
 
 -- Пример 7.21. MERGE. Вставка новых строк данных в таблицу bonus
 USE sample;
 MERGE INTO bonus B
 USING (SELECT project_no, budget
 FROM project) E
 ON (B.pr_no = E.project_no)
 WHEN MATCHED THEN
 UPDATE SET B.bonus = E.budget * 0.1
 WHEN NOT MATCHED THEN
 INSERT (pr_no, bonus)
 VALUES (E.project_no, E.budget * 0.05); 
 
 -- Пример 7.22. Применение инструкции OUTPUT
 USE sample;
 DECLARE @del_table TABLE (emp_no INT, emp_lname CHAR(20));
 DELETE employee
 OUTPUT DELETED.emp_no, DELETED.emp_lname INTO @del_table
 WHERE emp_no > 15000;
 SELECT * FROM @del_table 

 -- Пример 7.24. Уменьшение цены велосипедов на 20%
 USE AdventureWorks;
 SELECT ProductID, Product.Name as ProductName, ListPrice
 INTO temp_PriceList
 FROM Production.Product
 WHERE ListPrice > 500;
 UPDATE temp_PriceList
 SET ListPrice = ListPrice * 0.8
 WHERE ProductID IN (SELECT ProductID
 FROM AdventureWorks.Production.Product
 WHERE ProductSubcategoryID IN (SELECT ProductCategoryID
 FROM AdventureWorks.Production.ProductSubcategory
 WHERE ProductCategoryID IN (SELECT ProductCategoryID
 FROM AdventureWorks.Production.ProductCategory
 WHERE Name = 'Bikes'))); 