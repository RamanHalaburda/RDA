use RepublicDatabaseAutoservice

SELECT 
		[dbo].[Autoservice].[service_id], 
		[dbo].[Autoservice].[service_name], 
		[dbo].[Address].[region_id],
		[dbo].[Region].[region_title]
	FROM
		Autoservice JOIN [dbo].[Address] ON [Autoservice].[address_id] = [dbo].[Address].[address_id]
		JOIN [dbo].[Region] ON [dbo].[Address].[region_id] = [dbo].[Region].[region_id]
	where  
		[dbo].[Region].[region_title] = 'Минск'
GO

EXEC GetSTOByRegion 'Минск'

SELECT 
		[dbo].[Autoservice].[service_id], 
		[dbo].[Autoservice].[service_name],
		[dbo].[Address].[address_city]
	FROM
		Autoservice JOIN [dbo].[Address] ON [Autoservice].[address_id] = [dbo].[Address].[address_id]		
	where  
		[dbo].[Address].[address_city] = 'Брест'
GO

EXEC GetSTOByCity 'Брест'

SELECT 
		[dbo].[Autoservice].[service_id], 
		[dbo].[Autoservice].[service_name], 
		[dbo].[Address].[address_district]
	FROM
		Autoservice JOIN [dbo].[Address] ON [Autoservice].[address_id] = [dbo].[Address].[address_id]		
	where  
		[dbo].[Address].[address_district] = 'Щучинский'
GO

EXEC GetSTOByDistrict 'Щучинский'