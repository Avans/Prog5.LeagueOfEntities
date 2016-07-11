MERGE INTO [dbo].[CompetitionTeam] AS Target  
USING (values 
	(1, 1), (1, 2),
	(2, 3), (2, 4),
	(3, 5), (3, 6),
	(4, 1), (4, 6),
	(5, 1), (5, 3),
	(6, 6), (6, 2),
	(7, 1), (7, 2)
) AS Source (CompetitionId, TeamId)  
ON Target.CompetitionId = Source.CompetitionId
WHEN NOT MATCHED BY TARGET THEN  
	INSERT (CompetitionId, TeamId)
	VALUES (CompetitionId, TeamId);