SELECT DATEPART(MONTH, SalesOrderHeader.OrderDate) as month, DATEPART(YEAR, SalesOrderHeader.OrderDate) as year,
sum(UnitPrice) as totalSales FROM Sales.SalesOrderHeader
inner join Sales.SalesOrderDetail on SalesOrderDetail.SalesOrderID = SalesOrderHeader.SalesOrderID
GROUP BY DATEPART(MONTH, OrderDate), DATEPART(YEAR, OrderDate)
ORDER BY year asc, month asc;