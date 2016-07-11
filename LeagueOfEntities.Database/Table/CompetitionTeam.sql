CREATE TABLE [dbo].[CompetitionTeam]
(
	[CompetitionId] INT NOT NULL , 
    [TeamId] INT NOT NULL, 
    PRIMARY KEY ([CompetitionId], [TeamId]),
	CONSTRAINT FK_CompetitionTeam_Team FOREIGN KEY (TeamId) REFERENCES [dbo].[Team] ([Id]),
	CONSTRAINT FK_CompetitionTeam_Competition FOREIGN KEY (CompetitionId) REFERENCES [dbo].[Competition] ([Id])
)
