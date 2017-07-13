-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE GetSTOByAgeAndMakerCountry 
	-- Add the parameters for the stored procedure here
	@age TINYINT,
	@country NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT distinct 
		Autoservice.service_name AS [Название СТО],
		@age AS [Искомый год],
		(SELECT ByAge.byage_value FROM ByAge WHERE ByAge.byage_id = Work.work_age) AS [Коэффициент(возраст)],
		@country AS [Искомая страна],
		(SELECT ByAge.byage_value FROM ByAge WHERE ByAge.byage_id = Work.work_age) AS [Коэффициент(страна)]
	FROM 
		WorkCategory 
		JOIN Autoservice ON WorkCategory.category_id = Autoservice.service_id 
		JOIN Work ON Work.work_category = WorkCategory.category_id
			WHERE 
				Work.work_age IN (SELECT ByAge.byage_id FROM ByAge WHERE ByAge.age_min < @age AND ByAge.age_max > @age)
				AND
				Work.work_bymakercountry IN (SELECT ByMakerCountry.bymaker_id FROM ByMakerCountry WHERE ByMakerCountry.bymaker_name LIKE @country)
END
GO


