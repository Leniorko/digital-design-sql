SELECT managerP.LastName + ' ' + SUBSTRING(managerP.FirstName, 1, 1) + '. ' + CASE WHEN managerP.MiddleName IS NULL THEN ''
																					ELSE SUBSTRING(managerP.MiddleName, 1, 1)
																				END + '.', 
		managers.HireDate, managers.BirthDate, 
	   employees.LastName + ' ' + SUBSTRING(employees.FirstName, 1, 1) + '. ' + CASE WHEN employees.MiddleName IS NULL THEN ''
																					ELSE SUBSTRING(employees.MiddleName, 1, 1)
																				END + '.', 
	    employees.HireDate, employees.BirthDate 
FROM HumanResources.Employee as managers

JOIN Person.Person as managerP on managerP.BusinessEntityID = managers.BusinessEntityID
JOIN (SELECT iemployeeP.LastName, iemployeeP.FirstName, iemployeeP.MiddleName, iemployees.HireDate, iemployees.BirthDate, iemployees.OrganizationNode
      FROM HumanResources.Employee as iemployees
	  JOIN Person.Person as iemployeeP on iemployeeP.BusinessEntityID = iemployees.BusinessEntityID) as employees 
	  ON employees.OrganizationNode.GetAncestor(1) = managers.OrganizationNode

WHERE employees.BirthDate < managers.BirthDate AND employees.HireDate < managers.HireDate

ORDER BY managers.OrganizationNode, employees.LastName, employees.FirstName