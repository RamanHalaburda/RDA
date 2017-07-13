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

SELECT DISTINCT
	A.service_name AS "��������",
	/*A.service_location AS "����������",*/
	
	R.region_title AS "�������"/*,
	D.district_title  AS "�����"
	,
	C.city_title AS "�����"*/
	
FROM Autoservice A
INNER JOIN Address Addr 
	ON A.address_id = Addr.address_id	
INNER JOIN dbo.Region R
	ON Addr.region_id = R.region_id /*
INNER JOIN dbo.District D
	ON R.region_id = D.region_id 
INNER JOIN dbo.City C 
	ON Addr.city_id = C.city_id */
INNER JOIN WorkCategory WC
	ON A.service_id = WC.service_id
INNER JOIN Category Ctgr
	ON Ctgr.category_id = WC.category_id
	
	/*
WHERE (@region IS NULL OR R.region_title = @region)
	AND (@district IS NULL OR D.district_title = @district)
	AND (@city IS NULL OR C.city_title = @city)
	AND (@category IS NULL OR Ctgr.category_name = @category)	*/
	 
ORDER BY A.service_name	

GO