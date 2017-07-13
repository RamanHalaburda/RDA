EXEC GetSTOByAgeOfAuto 4

SELECT distinct 
		Autoservice.service_name AS [Название СТО],
		4 AS [искомый год],
		(SELECT ByAge.byage_value FROM ByAge WHERE ByAge.byage_id = Work.work_age) AS [Коэффициент]
	FROM 
		WorkCategory 
		JOIN Autoservice ON WorkCategory.category_id = Autoservice.service_id 
		JOIN Work ON Work.work_category = WorkCategory.category_id
			WHERE 
				Work.work_age IN (SELECT ByAge.byage_id FROM ByAge WHERE ByAge.age_min < 4 AND ByAge.age_max > 4)
GO

EXEC GetSTOByAgeAuto 4
GO

EXEC GetSTOByAgeAuto 6
GO

SELECT distinct 
		Autoservice.service_name AS [Название СТО],
		6 AS [Искомый год],
		(SELECT ByAge.byage_value FROM ByAge WHERE ByAge.byage_id = Work.work_age) AS [Коэффициент(возраст)],
		6 AS [Искомая страна],
		(SELECT ByAge.byage_value FROM ByAge WHERE ByAge.byage_id = Work.work_age) AS [Коэффициент(страна)]
	FROM 
		WorkCategory 
		JOIN Autoservice ON WorkCategory.category_id = Autoservice.service_id 
		JOIN Work ON Work.work_category = WorkCategory.category_id
			WHERE 
				Work.work_age IN (SELECT ByAge.byage_id FROM ByAge WHERE ByAge.age_min < 4 AND ByAge.age_max > 4)
				AND
				Work.work_bymakercountry IN (SELECT ByMakerCountry.bymaker_id FROM ByMakerCountry WHERE ByMakerCountry.bymaker_name LIKE 'Европа')
GO

EXEC GetSTOByAgeAndMakerCountry 4,'Европа'
GO

SELECT Autoservice.service_name FROM Autoservice 
	WHERE Autoservice.service_id IN ()