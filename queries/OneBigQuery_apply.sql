USE RepublicDatabaseAutoservice
GO

DECLARE @region NVARCHAR(20) = NULL
DECLARE @district NVARCHAR(20) = NULL
DECLARE @city NVARCHAR(20) = NULL

DECLARE @brand NVARCHAR(20) = NULL
DECLARE @model NVARCHAR(50) = NULL

DECLARE @category NVARCHAR(20) = NULL

DECLARE @age INTEGER = NULL
DECLARE @country NVARCHAR(30) = NULL

SELECT
	[Autoservice].[service_name] AS "Название", 
	[Autoservice].[service_location] AS "Координаты",
	Re.region_title AS "Область",
	Di.district_title  AS "Район",
	Ci.city_title AS "Город"
	
	FROM
		[dbo].[Autoservice] 
			INNER JOIN [dbo].[Address] 
				ON 
					[Autoservice].[address_id] = [dbo].[Address].[address_id]
					 CROSS APPLY 
						(SELECT * FROM [dbo].[Region] 
							WHERE 
								[dbo].[Address].[region_id] = [dbo].[Region].[region_id]
								AND
								([dbo].[Region].[region_title] = @region OR @region IS NULL)) as Re
						
					 cross APPLY 
						(SELECT * FROM [dbo].[District] 
							WHERE 
								[dbo].[Address].[district_id] = [District].district_id
								AND
								([dbo].[District].[district_title] = @district OR @district IS NULL)) Di

					 cross APPLY 
						(SELECT * FROM [dbo].[City] 
							WHERE							
								[dbo].[Address].[city_id] = [City].city_id
								AND
								([dbo].[City].[city_title] = @city OR @city IS NULL)) Ci
						 
		WHERE
					
					[Autoservice].[service_id] IN
						(
							SELECT distinct [WorkCategory].[service_id] 
								FROM [WorkCategory] JOIN [Category]
									ON [Category].[category_id] = [WorkCategory].[category_id]
									WHERE [dbo].[Category].[category_name] = @category OR @category IS NULL
							group by WorkCategory.service_id		
						)

					AND
					/* by age */
					[Autoservice].[service_id] IN
						(
							SELECT Autoservice.service_id 
								FROM Autoservice LEFT JOIN [dbo].[WorkCategory] 
									ON [WorkCategory].[service_id] = [Autoservice].[service_id]
								LEFT JOIN [dbo].[Work]
									ON 
										[Work].[work_id] = [WorkCategory].[work_id]
										AND
										[Work].[work_age] IN (SELECT DISTINCT [ByAge].[byage_id] FROM [ByAge] WHERE [ByAge].[age_min] < @age AND [ByAge].[age_max] > @age )
						)

					AND
					/* by model and brand */
					[dbo].[Autoservice].[service_id] IN
						(
							SELECT DISTINCT Autoservice.service_id 
								FROM Autoservice LEFT JOIN [dbo].[WorkCategory] 
									ON [WorkCategory].[service_id] = [Autoservice].[service_id]
								LEFT JOIN [dbo].[Work]
									ON 
										[Work].[work_id] = [WorkCategory].[work_id]
										AND 
										[Work].[brand_id] IN 
											( SELECT DISTINCT [Brand].[brand_id] 
												FROM [Brand] 
												WHERE [Brand].[brand_title] = @brand OR @brand IS NULL
											)
										AND
										[Work].[model_id] IN 
											( SELECT DISTINCT [Model].[model_id] 
												FROM [Model] 
												WHERE [Model].[model_title] = @model OR @model IS NULL
											)
						)

ORDER BY [dbo].[Autoservice].[service_name]
GO	