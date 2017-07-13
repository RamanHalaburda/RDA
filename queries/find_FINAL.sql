/*
exactly doing

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
	A.service_name AS "Название",
	A.service_location AS "Координаты",
	
	R.region_title AS "Область",
	D.district_title  AS "Район"
	,
	C.city_title AS "Город"
	
	FROM Autoservice A
INNER JOIN Address Addr 
	ON A.address_id = Addr.address_id	
INNER JOIN Region R
	ON Addr.region_id = R.region_id
INNER JOIN dbo.District D
	ON Addr.district_id = D.district_id
INNER JOIN dbo.City C
	ON Addr.city_id = C.city_id
INNER JOIN WorkCategory WC
	ON A.service_id = WC.service_id
INNER JOIN Category Ctgr
	ON Ctgr.category_id = WC.category_id
	
	
WHERE (@region IS NULL OR R.region_title = @region)
	AND (@district IS NULL OR D.district_title = @district)
	AND (@city IS NULL OR C.city_title = @city)
	AND (@category IS NULL OR Ctgr.category_name = @category)	
	 
ORDER BY A.service_name	

GO
*/

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
	A.service_name AS "Название",/*
	A.service_location AS "Координаты",*/
	
	Addr.region_title AS "Область",
	Addr.district_title  AS "Район"
	,
	Addr.city_title AS "Город"
	
	FROM Autoservice A
INNER JOIN (SELECT Address.address_id, R.region_title, D.district_title, C.city_title 
				FROM Address
				INNER JOIN Region R on R.region_id = Address.region_id 
				INNER JOIN District D on Address.district_id = D.district_id
				INNER JOIN City C ON Address.city_id = C.city_id) Addr
	ON Addr.address_id = A.address_id
INNER JOIN WorkCategory WC
	ON A.service_id = WC.service_id
INNER JOIN Category Ctgr
	ON Ctgr.category_id = WC.category_id
INNER JOIN (SELECT Work.work_id, BA.age_min, BA.age_max, Br.brand_title, Mo.model_title 
				FROM Work
				INNER JOIN ByAge BA ON BA.byage_id = Work.work_age
				INNER JOIN Brand Br ON Br.brand_id = Work.brand_id
				INNER JOIN Model Mo ON Mo.model_id = Work.model_id) W
	ON WC.work_id = W.work_id
	
WHERE (@region IS NULL OR Addr.region_title = @region)
	AND (@district IS NULL OR Addr.district_title = @district)
	AND (@city IS NULL OR Addr.city_title = @city)
	AND (@category IS NULL OR Ctgr.category_name = @category)
	AND (@age IS NULL OR (W.age_min < @age AND W.age_max > @age))
	AND (@brand IS NULL OR (W.brand_title = @brand))
	AND (@model IS NULL OR (W.model_title = @model))	
	 
ORDER BY A.service_name	

GO

EXEC GetSTO NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL
GO

EXEC GetSTO 'Брестская',NULL,NULL,NULL,NULL,NULL,NULL,NULL
GO

EXEC GetSTO NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL
GO