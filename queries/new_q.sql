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
CREATE PROCEDURE GetSTOByCategory 
	-- Add the parameters for the stored procedure here
	@category VARCHAR(15)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [dbo].[Autoservice].service_name 
	FROM [dbo].[Autoservice] JOIN [dbo].[WorkCategory] ON [dbo].[Autoservice].service_id = [dbo].[WorkCategory].service_id
		AND [dbo].[WorkCategory].category_id IN (SELECT category_id FROM Category WHERE Category.category_name LIKE @category)
END
GO
