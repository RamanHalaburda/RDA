USE RepublicDatabaseAutoservice
GO

SELECT DISTINCT Region.region_id, Region.region_title
	FROM Region 
		INNER JOIN Address 
			ON Region.region_id = Address.region_id
		INNER JOIN Autoservice 
			ON Address.address_id = Autoservice.address_id
		INNER JOIN WorkCategory
			ON WorkCategory.service_id = Autoservice.service_id 
				AND WorkCategory.service_id 
					IN 
					(SELECT T.service_id FROM (SELECT COUNT(*) AS CategoryCounter, WorkCategory.service_id FROM WorkCategory GROUP BY WorkCategory.service_id) AS T WHERE T.CategoryCounter >= 3) 


SELECT DISTINCT Region.region_id, Region.region_title
	FROM Region 
		INNER JOIN Address 
			ON Region.region_id = Address.region_id
		INNER JOIN Autoservice 
			ON Address.address_id = Autoservice.address_id
		INNER JOIN WorkCategory
			ON WorkCategory.service_id = Autoservice.service_id 
	
		INNER JOIN (SELECT COUNT(*) AS CategoryCounter, WorkCategory.service_id FROM WorkCategory GROUP BY WorkCategory.service_id) TT
			ON WorkCategory.service_id = TT.CategoryCounter AND TT.CategoryCounter >= 3


					(SELECT T.service_id FROM (SELECT COUNT(*) AS CategoryCounter, WorkCategory.service_id FROM WorkCategory GROUP BY WorkCategory.service_id) AS T WHERE T.CategoryCounter >= 3) 



CREATE VIEW v_STO_3_category 
AS
SELECT T.service_id FROM (SELECT COUNT(*) AS CategoryCounter, WorkCategory.service_id FROM WorkCategory GROUP BY WorkCategory.service_id) AS T WHERE T.CategoryCounter >= 3



select 
		count(*) as col WorkCategory.service_id, 
		WorkCategory.service_id 
	from WorkCategory 
	group by WorkCategory.service_id

select 
		T.service_id 
	from (select 
			count(*) as CategoryCounter, 
			WorkCategory.service_id 
		from WorkCategory 
		group by WorkCategory.service_id) as T 
	where T.CategoryCounter >= 3
		

(SELECT T.service_id FROM (SELECT COUNT(*) AS CategoryCounter, WorkCategory.service_id FROM WorkCategory GROUP BY WorkCategory.service_id) AS T WHERE T.CategoryCounter >= 3) 
