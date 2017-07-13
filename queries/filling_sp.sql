use RepublicDatabaseAutoservice
GO

/* all districts */
select District.district_id, [district_title] from District order by [district_id]
GO

EXEC GetAllDistricts
GO

/* all cities */
select [city_id], [city_title] from City order by [city_id]
GO

EXEC GetAllCities
GO

/* all coutries */
select [bymaker_id], [bymaker_name] from [dbo].[ByMakerCountry] order by [bymaker_id]
GO

EXEC GetAllCountries
GO

/* reduce district*/
select District.district_id ,District.district_title 
	from District JOIN Region 
	on Region.region_id = District.region_id and region_title = 'Брестская'
	order by District.district_id
GO

EXEC GetDistrictsByRegion 'Брестская'
GO

/* reduce cities */
SELECT [City].[city_id], [City].[city_title]
	FROM City JOIN District
	ON District.district_id = City.district_id AND district_title = 'Берёзовский'
	ORDER BY [City].[city_id]
GO

EXEC GetCitiesByDistrict 'Берёзовский'
GO

/* reduce models */
SELECT [Model].[model_id], [Model].[model_title]
	FROM Model JOIN Brand
	ON [Brand].[brand_id] = [Model].[brand_id] AND [Brand].[brand_title] = 'Audi'
	ORDER BY [Model].[model_id]
GO

EXEC GetModelsByBrand 'Audi'
GO