CREATE PROCEDURE HumanResources.UnmariedEmployees(
	@fromDate as DATE,
	@toDate as DATE,
	@total as INT OUTPUT
) 
AS

SELECT  * FROM HumanResources.Employee
WHERE Gender = 'M' and MaritalStatus = 'S' and BirthDate >= @fromDate and BirthDate <= @toDate

SELECT @total = COUNT(*) FROM HumanResources.Employee
WHERE Gender = 'M' and MaritalStatus = 'S' and BirthDate >= @fromDate and BirthDate <= @toDate

RETURN 
GO

DECLARE @total INT
DECLARE @a date
DECLARE @b date
SELECT @a = PARSE('01.01.1980' as date)
SELECT @b = PARSE('01.01.1990' as date)
EXEC HumanResources.UnmariedEmployees @a, @b, @total output
SELECT @total

DROP PROCEDURE HumanResources.UnmariedEmployees