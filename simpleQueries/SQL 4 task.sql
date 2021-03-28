SELECT Person.LastName, Person.FirstName, Product.Name, COUNT(*) as Amount FROM Sales.Customer
JOIN Person.Person on Customer.PersonID = Person.BusinessEntityID
JOIN Sales.SalesOrderHeader on SalesOrderHeader.CustomerID = Customer.CustomerID
JOIN Sales.SalesOrderDetail on SalesOrderHeader.SalesOrderID = SalesOrderDetail.SalesOrderID
JOIN Production.Product on Product.ProductID = SalesOrderDetail.ProductID
GROUP BY Product.Name, Person.LastName, Person.FirstName
HAVING COUNT(*) > 5
ORDER BY FirstName ASC, Amount desc