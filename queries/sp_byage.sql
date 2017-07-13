EXEC GetSTOByAgeOfAuto 4

SELECT distinct 
		Autoservice.service_name AS [�������� ���],
		4 AS [������� ���],
		(SELECT ByAge.byage_value FROM ByAge WHERE ByAge.byage_id = Work.work_age) AS [�����������]
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
		Autoservice.service_name AS [�������� ���],
		6 AS [������� ���],
		(SELECT ByAge.byage_value FROM ByAge WHERE ByAge.byage_id = Work.work_age) AS [�����������(�������)],
		6 AS [������� ������],
		(SELECT ByAge.byage_value FROM ByAge WHERE ByAge.byage_id = Work.work_age) AS [�����������(������)]
	FROM 
		WorkCategory 
		JOIN Autoservice ON WorkCategory.category_id = Autoservice.service_id 
		JOIN Work ON Work.work_category = WorkCategory.category_id
			WHERE 
				Work.work_age IN (SELECT ByAge.byage_id FROM ByAge WHERE ByAge.age_min < 4 AND ByAge.age_max > 4)
				AND
				Work.work_bymakercountry IN (SELECT ByMakerCountry.bymaker_id FROM ByMakerCountry WHERE ByMakerCountry.bymaker_name LIKE '������')
GO

EXEC GetSTOByAgeAndMakerCountry 4,'������'
GO

SELECT Autoservice.service_name FROM Autoservice 
	WHERE Autoservice.service_id IN ()