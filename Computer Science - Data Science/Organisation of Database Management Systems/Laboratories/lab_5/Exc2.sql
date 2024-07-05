SELECT [BusinessEntityID]
      ,[PersonType]
      ,[NameStyle]
      ,[Title]
      ,[FirstName]
      ,[MiddleName]
      ,[LastName]
      ,[Suffix]
      ,[EmailPromotion]
      ,[rowguid]
      ,[ModifiedDate]
INTO [Person]
FROM [AdventureWorks2017].[Person].[Person]
CREATE  INDEX Person_First_Last_Name_Idx
ON Person(LastName, FirstName)



SELECT * FROM [Person] WHERE LastName = 'Agbonile'


SELECT * FROM [Person]  WHERE LastName = 'Price'



SELECT * FROM [Person] WHERE LastName = 'Agbonile' AND FirstName = 'Osarumwense'

SELECT * FROM [Person] WHERE FirstName = 'Osarumwense'


SELECT * FROM [Person] WHERE LastName = 'Price' AND FirstName = 'Angela'

SELECT * FROM [Person] WHERE FirstName = 'Angela'