MERGE INTO Team AS Target  
USING (values 
	(1, 'Royal Never Give Up', 1405, 'China', 'RNG.png' ), 
	(2, 'SKT T1', 1393, 'Korea', 'SKT.png' ), 
	(3, 'Edward Gaming', 1391, 'China', 'EG.png' ), 
	(4, 'Immortals', 1389, 'United States', 'IM.png' ), 
	(5, 'Flash Wolves', 1331, 'Taiwan', 'FW.png' ), 
	(6, 'Fnatic', 1165, 'Europe', 'FN.png' )
) AS Source (Id, Name, Ranking, Country, LogoURL)  
ON Target.Id = Source.Id  
WHEN NOT MATCHED BY TARGET THEN  
	INSERT (Id, Name, Ranking, Country, LogoURL) 
	VALUES (Id, Name, Ranking, Country, LogoURL)
WHEN MATCHED THEN
	UPDATE SET
		Name = Source.Name,
		Ranking = Source.Ranking,
		Country = Source.Country,
		LogoURL = Source.LogoURL;
