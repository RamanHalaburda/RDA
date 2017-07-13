USE [RepublicDatabaseAutoservice]
GO

SET NOCOUNT ON;  
GO

DECLARE @age_value tinyint;
SET @age_value = 11;

SELECT DISTINCT
	   [dbo].[Autoservice].[service_id]
      ,[dbo].[Autoservice].[service_name]
      ,[dbo].[Autoservice].[address_id]
  FROM 
	[dbo].[Autoservice] 
		JOIN [dbo].[WorkCategory] ON [dbo].[Autoservice].[service_id] = [dbo].[WorkCategory].[service_id]
		JOIN [dbo].[Work] ON [dbo].[Work].[work_id] = [dbo].[WorkCategory].[work_id]
		WHERE [dbo].[Work].[difficulty_id] 
			IN (SELECT [dbo].[Difficulty].[dif_id] FROM [dbo].[Difficulty] 
				WHERE @age_value >= [dbo].[Difficulty].dif_minvalue AND @age_value < [dbo].[Difficulty].[dif_maxvalue]);
GO

EXEC GetSTOBYAgeOfAuto 11



