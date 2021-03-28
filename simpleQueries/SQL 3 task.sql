SELECT TOP(10) vIndividualCustomer.City, count(*) as Priority FROM Sales.vIndividualCustomer
LEFT JOIN Sales.vStoreWithAddresses ON Sales.vIndividualCustomer.City = Sales.vStoreWithAddresses.City
WHERE Sales.vStoreWithAddresses.City is NULL
GROUP BY vIndividualCustomer.City
ORDER BY count(*) DESC