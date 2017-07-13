-- ================================================
-- Template generated from Template Explorer using:
-- Create Trigger (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- See additional Create Trigger templates for more
-- examples of different Trigger statements.
--
-- This block of comments will not be included in
-- the definition of the function.
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
CREATE TRIGGER tg_CheckDifferenceBytweenNewAndOldDurations 
   ON  [dbo].[WorkOn] 
   AFTER UPDATE
AS IF UPDATE ([workon_duration])
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	DECLARE @sumdur1 FLOAT 
	DECLARE @sumdur2 FLOAT 
	DECLARE @sumdur_new FLOAT
	
	SELECT @sumdur_new = (SELECT SUM([workon_duration]) FROM inserted)
	
	SELECT @sumdur1 = (SELECT SUM(w.[workon_duration])
		FROM [dbo].[WorkOn] w WHERE 
			w.work_id NOT IN (SELECT deleted.work_id FROM deleted)
			AND
			w.service_id NOT IN (SELECT deleted.service_id FROM deleted)
			)

	SELECT @sumdur2 = (SELECT SUM([workon_duration]) FROM deleted)
	
	IF @sumdur_new > (@sumdur1 + @sumdur2)*1.5
	BEGIN
		PRINT 'No modification of budgets'
		ROLLBACK TRANSACTION
	END
	ELSE
		PRINT 'The modification of budgets executed' 
END
GO
