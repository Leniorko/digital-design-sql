SELECT MIN(OrderDate) as FirstOrderDate, p.LastName, p.FirstName
, (SELECT CONCAT(';', iprod.Name, ' Amount: ', isod.OrderQty) From Sales.Customer as ic 
	JOIN Person.Person as ip on ic.PersonID = ip.BusinessEntityID
	JOIN Sales.SalesOrderHeader as isoh on isoh.CustomerID = ic.CustomerID
	JOIN Sales.SalesOrderDetail as isod on isod.SalesOrderID = isoh.SalesOrderID
	JOIN Production.Product as iprod on iprod.ProductID = isod.ProductID
	WHERE ip.BusinessEntityID = p.BusinessEntityID
	FOR XML PATH('')) 
	FROM Sales.Customer as c
JOIN Person.Person as p on c.PersonID = p.BusinessEntityID
JOIN Sales.SalesOrderHeader as soh on soh.CustomerID = c.CustomerID
JOIN Sales.SalesOrderDetail as sod on sod.SalesOrderID = soh.SalesOrderID
JOIN Production.Product as prod on prod.ProductID = sod.ProductID
GROUP BY p.BusinessEntityID, p.LastName, p.FirstName
ORDER BY FirstOrderDate