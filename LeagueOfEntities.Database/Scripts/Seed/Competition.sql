MERGE INTO Competition AS Target  
USING (values 
	(1, '2016-01-01', 'Quarter finale'),
	(2, '2016-01-01', 'Quarter finale'),
	(3, '2016-01-01', 'Quarter finale'),
	(4, '2016-01-01', 'Quarter finale'),
	(5, '2016-01-02', 'Half finale'),
	(6, '2016-01-02', 'Half finale'),
	(7, '2016-01-03', 'Finale')
) AS Source (Id, Date, Name)  
ON Target.Id = Source.Id  
WHEN NOT MATCHED BY TARGET THEN  
	INSERT (Id, Date, Name)  
	VALUES (Id, Date, Name)  
WHEN MATCHED THEN
	UPDATE SET
		Name = Source.Name,
		Date = Source.Date;
