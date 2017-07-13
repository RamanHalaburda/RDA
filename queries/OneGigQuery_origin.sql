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
	[Region].[region_title] AS "Область",
	[Address].[address_district] AS "Район",
	[Address].[address_city] AS "Город"
	FROM
		[dbo].[Autoservice] 
			INNER JOIN [dbo].[Address] 
				ON 
					[Autoservice].[address_id] = [dbo].[Address].[address_id]
					AND
					([dbo].[Address].[address_district] = @district OR @district IS NULL)
					AND
					([dbo].[Address].[address_city] = @city OR @city IS NULL) 
			INNER JOIN [dbo].[Region] 
				ON 
					([dbo].[Address].[region_id] = [dbo].[Region].[region_id])
					AND
					([dbo].[Region].[region_title] = @region OR @region IS NULL)
					AND
					
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
										[Work].[work_age] IN (SELECT [ByAge].[byage_id] FROM [ByAge] WHERE [ByAge].[age_min] < @age AND [ByAge].[age_max] > @age )
						)

					AND
					/* by model and brand */
					[dbo].[Autoservice].[service_id] IN
						(
							SELECT Autoservice.service_id 
								FROM Autoservice LEFT JOIN [dbo].[WorkCategory] 
									ON [WorkCategory].[service_id] = [Autoservice].[service_id]
								LEFT JOIN [dbo].[Work]
									ON 
										[Work].[work_id] = [WorkCategory].[work_id]
										AND 
										[Work].[brand_id] IN 
											( SELECT [Brand].[brand_id] 
												FROM [Brand] 
												WHERE [Brand].[brand_title] = @brand OR @brand IS NULL
											)
										AND
										[Work].[model_id] IN 
											( SELECT [Model].[model_id] 
												FROM [Model] 
												WHERE [Model].[model_title] = @model OR @model IS NULL
											)
						)
			/* by age */
			/*
			INNER JOIN [dbo].[WorkCategory] 
				ON
					[WorkCategory].[service_id] = [Autoservice].[service_id]
			LEFT JOIN [dbo].[Work]
				ON
					[Work].[work_id] = [WorkCategory].[work_id]
					AND
					[Work].[work_age] IN (SELECT [ByAge].[byage_id] FROM [ByAge] WHERE [ByAge].[age_min] < @age AND [ByAge].[age_max] > @age )
			*/
			
			/* by model and brand */



/*GROUP BY [dbo].[Autoservice].service_id*/
ORDER BY [dbo].[Autoservice].[service_name]
GO	